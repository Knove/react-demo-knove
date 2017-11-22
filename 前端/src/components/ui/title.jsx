/**
 * Created by Knove on 2017/11/9.
 */
import React from 'react';
import {Menu, Dropdown, Icon, Modal, Carousel, Button,notification } from 'antd';
import {connect} from 'react-redux'; // 引入connect
import {getOnlineNumber} from '../../action/socket';
import { foodInit,deskSearch} from '../../action/action';

const openNotification = (type,title,message) => {
    notification.config({
        placement: 'bottomLeft',
        duration:10,
    });
    notification[type]({
        message:title,
        description:message,
    });
};

const rightMenu = (
    <Menu>
        <Menu.Item key="0">
            <a href="#/main/UserOrdering">服务员订餐页面</a>
        </Menu.Item>
        <Menu.Item key="1">
            <a href="#/main/FoodInfo">后台运维页面-菜品信息</a>
        </Menu.Item>
        <Menu.Item key="2">
            <a href="#/main/OrderInfo">后台运维页面-订单明细</a>
        </Menu.Item>
        <Menu.Divider/>
        <Menu.Item key="3">雄鹰订餐系统</Menu.Item>
    </Menu>
);

class Title extends React.Component {

    send_echo() {

        const {getOnlineNumber,foodInit,deskSearch} = this.props;
        let wsUri = "ws://30.87.246.189:8080/websocket";
        let echo_websocket = new WebSocket(wsUri);
        echo_websocket.onopen = function (evt) {
            echo_websocket.send("online");
        }
        echo_websocket.onmessage = function (evt) {
            let message=JSON.parse(evt.data);//转为数组
            console.log(message);
            if (message.type == "online") {
                //如果形式为在线人数
                getOnlineNumber(message.text);
            }else if(message.type == "dish"){
                //提示上新菜
                if(message.status==1){
                    openNotification("info","新上菜品",message.data+"上线了！");
                }else  if(message.status==2){
                    openNotification("warning","修改菜品",message.data+"被修改！");
                }else if(message.status==3){
                    openNotification("error","菜品下架",message.data+"下架了！");
                }

                //刷新 菜品页面
                foodInit();
            }else  if(message.type == "desk"){

                if(message.status==1){
                    openNotification("warning","桌位被占用","桌位"+message.data+"现在已经被占用！");
                }else if(message.status==2){
                    openNotification("success","桌位已经空置","桌位"+message.data+"现在已经留空！");
                }

                deskSearch();


            }
        };
    }

    constructor(props) {
        super(props);
        this.state = {
            visible: false,
        };
        this.showModal = this.showModal.bind(this);
        this.handleCancel = this.handleCancel.bind(this);
        this.send_echo = this.send_echo.bind(this);
        this.send_echo();
    }

    showModal() {
        this.setState({
            visible: true,
        });
    }

    handleCancel() {
        this.setState({
            visible: false,
        });
    }

    render() {
        function onChange(a, b, c) {
            console.log(a, b, c);
        }

        return (
            <div>
                <div className="titleAll">
                    <img src={require("../../img/logo.png")} onClick={this.showModal}/>
                    <span className="titleFont">欢迎使用雄鹰订餐系统</span>

                    <Dropdown overlay={rightMenu} trigger={['click']} className="icon">
                        <a className="ant-dropdown-link icon" href="#">
                            <span className="onlineText">在线 ：{this.props.onlineNumber}人 </span>
                            <Icon type="ellipsis"/>
                        </a>
                    </Dropdown>

                </div>
                {this.props.children}
                <Modal
                    className={"text-center"}
                    onCancel={this.handleCancel}
                    visible={this.state.visible}
                    title={"雄鹰订餐系统使用指南"}
                    footer={<Button type="primary" onClick={this.handleCancel}>关闭</Button>}
                >
                    <Carousel afterChange={onChange}>
                        <div>
                            <p><b>使用步骤说明</b></p>
                            <p className={"text-left1"}>
                                <p>1、在选桌区选择可使用餐桌</p>
                                <p>2、在选餐区选择未售完菜品，点击所需菜品后，其会在订单明细区显示，可在此区菜品进行数量、删除操作</p>
                                <p>3、订单无误后，提交订单，此后订单不能再做修改</p>
                                <p>4、每道菜品上完后，在订单明细区点击“上菜”，对已上菜品进行标记</p>
                                <p>5、客人吃完结账时，点击结账，此单结束</p>
                            </p>

                        </div>
                        <div>
                            <p><b>各区域详细说明</b></p>
                            <p className={"text-left"}><b>选桌区：</b>显示所有餐桌的使用情况，红色表示餐桌正在使用，灰色表示餐桌未使用，绿色表示餐桌正在点单。</p>
                            <p className={"text-left"}><b>售空菜品区：</b>显示当前已售空的所有菜品。</p>
                            <p className={"text-left"}><b>选餐区：</b>显示餐厅提供的所有菜品，灰色表示菜品可选，红色表示菜品已售空。</p>
                            <p className={"text-left"}><b>订单明细区：</b>显示当前订单的信息，未提交订单前可对菜品进行操作；提交订单后，此订单不能再做修改；
                                每道菜品上完后，点击上菜对其进行标记；客人结账后，点击结账，此单结束。</p>
                        </div>
                    </Carousel>
                </Modal>

            </div>
        );
    }
}

const mapStateToProps = (state) => {
    return {
        onlineNumber: state.httpData.Socket.onlineNumber,
    };
};
Title = connect(mapStateToProps, {getOnlineNumber,foodInit,deskSearch})(Title);
//后面的FoodInfo是UI组件，前面的FoodInfo是通过connect生成的容器组件
export default Title;

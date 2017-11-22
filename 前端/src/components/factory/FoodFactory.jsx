/**
 * Created by Knove on 2017/11/13.
 *  描述：制造菜品的工厂
 */
import React from 'react';
import {Card, Spin, Modal} from 'antd';
import {connect} from 'react-redux'; // 引入connect
import {addFoodDetails, pointNowDesk, foodInit} from '../../action/action';

function info() {
    Modal.info({
        title: 'This is a notification message',
        content: (
            <div>
                <p>some messages...some messages...</p>
                <p>some messages...some messages...</p>
            </div>
        ),
        onOk() {
        },
    });
}

function warning() {
    Modal.warning({
        title: '注意',
        content: '请选择桌号！',
    });
}

function error(msg) {
    Modal.error({
        title: '抱歉',
        content: msg,
    });
}

let loading = true;

class FoodFactory extends React.Component {


    constructor(props) {
        super(props);
        this.state = {};
        this.addFoods = this.addFoods.bind(this);
        this.nowDeskNumber = this.nowDeskNumber.bind(this);

        const {foodInit} = this.props;
        foodInit();
    }

    addFoods(index, nowDeskNum, nowFoodNum, foodName, foodPrice, foodNum) {
        const {addFoodDetails} = this.props;

        //获取当前桌子状态
        let nowDeskInfo = this.props.deskInfo;
        console.log(nowDeskInfo);
        let deskStatus = 0;
        if (nowDeskInfo != null) {
            for (let i = 0, index = nowDeskInfo.length; i < index; i++) {
                if (nowDeskInfo[i].id == this.props.nowDeskNumber) {
                    deskStatus = nowDeskInfo[i].deStatus;
                }
            }
        }

        if (nowDeskNum == null) {
            console.log("请选择桌号");
            warning();
        } else {

            if (deskStatus == 0) {
                addFoodDetails(index, nowDeskNum, nowFoodNum, foodName, foodPrice, foodNum);
                console.log("给" + nowDeskNum + "桌添加菜品！" + foodName);
            } else {
                error("订单已经提交，不可以再增加菜品！");
            }

        }
    }

    nowDeskNumber(number) {
        const {pointNowDesk} = this.props;
        pointNowDesk(number);
        console.log("现在指定的桌号为：" + number);
    }

    render() {
        let deskTable = new Array(); //当前桌子菜品详情
        let nowDeskNum = this.props.nowDeskNumber;
        let nowFoodNum = this.props.getDeskFoodArraynum;
        let factory = null;
        let foodArray = new Array();
        if (nowDeskNum != null && this.props.deskTable != null) {
            deskTable = this.props.deskTable[nowDeskNum].foodArray;

            for (let i = 0; i < deskTable.length; i++) {
                foodArray.push(deskTable[i].FoodName);
            }
            console.log(foodArray);
        }
        if (this.props.loading) loading = false;

        if (this.props.foodMain != null) {


            factory = this.props.foodMain.map((item, index) => {

                if ((item.dcId == this.props.fid && this.props.searchFoodShort == '') || (this.props.searchFoodShort != '' && !item.dCn.indexOf(this.props.searchFoodShort))) {
                    if (foodArray.includes(item.dName))    //控制是否选了这个菜判断
                        return <Card.Grid className="foodButton normalFood edFood"
                                          onClick={index => this.addFoods(item.id, nowDeskNum, nowFoodNum, item.dName, item.dPrice, item.dCount)}>{item.dName} {item.dPrice}¥</Card.Grid>;
                    else if (item.dCount == 0) return <Card.Grid
                        className="foodButton normalFood lackFood">{item.dName} {item.dPrice}¥</Card.Grid>;
                    else return <Card.Grid className="foodButton normalFood"
                                           onClick={index => this.addFoods(item.id, nowDeskNum, nowFoodNum, item.dName, item.dPrice, item.dCount)}>
                            {item.dName} {item.dPrice}¥
                        </Card.Grid>;
                }
            });
        }
        return (
            <Spin size="large" spinning={loading}>
                <Card noHovering bordered={false} className="factoryFood">

                    {factory}
                </Card>
            </Spin>
        );
    }
}

const mapStateToProps = (state) => {
    let nowDeskNumber = state.httpData.deskNumber;
    let foodSum = '';
    if (nowDeskNumber == null) nowDeskNumber = 0;
    if (state.httpData.deskTable[nowDeskNumber].foodArray != null) foodSum = state.httpData.deskTable[nowDeskNumber].foodArray.length;
    return {
        nowDeskNumber: state.httpData.deskNumber,
        getDeskFoodArraynum: foodSum,
        foodMain: state.httpData.foodTable,
        loading: state.httpData.foodSuccess,
        deskInfo: state.httpData.deskInfo,
        deskTable: state.httpData.deskTable,
    };
};
//connect 实现， mapStateToProps将state传入props，参数2 将 action 作为 props 绑定到 MyComp 上
FoodFactory = connect(mapStateToProps, {addFoodDetails, pointNowDesk, foodInit})(FoodFactory);

export default FoodFactory;

/**
 * Created by Knove on 2017/11/13.
 *  描述：服务员订餐页面的订单明细选项卡
 */
import React from 'react';
import {Card, Table, Button, InputNumber, Modal} from 'antd';
import {connect} from 'react-redux'; // 引入connect
import {
    deleteFoodDetails,
    numberFoodDetails,
    pushOrder,
    endOrder,
    pointNowDesk,
    submitFood,
    ClearStoreBydeskNumber,
    ClearStoreByOrderSE,
} from '../../../action/action';

let orderNumber = '';
let orderTime = '';
let orderId = '';
let putOrderSE;  //提交订单状态
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

function success(text) {
    Modal.success({
        title: '成功！',
        content: text,
    });
}
function warning(text,title) {
    Modal.warning({
        title:title,
        content: text,
    });
}
function error(text,title) {
    let array=text.map((item)=>{
        return  <p>{item}</p>
    });
    Modal.error({
        title: title,
        content: (
            <div>
                {array}
            </div>
        ),
    });
}

let g_key = 1;
let foodNum = 0;
let sumPrice = 0;
let g_stats = 0;  //状态   0为 购物车  1 为订单明细
class SelectFood extends React.Component {
    constructor(props) {
        super(props);
        this.state = {};
        this.doDelete = this.doDelete.bind(this);
        this.onChange = this.onChange.bind(this);
        this.summitOrder = this.summitOrder.bind(this);
        this.endOrder = this.endOrder.bind(this);
    }

    nowDeskNumber(number) {
        const {pointNowDesk} = this.props;
        pointNowDesk(number);
        console.log("现在指定的桌号为：" + number);
    }

    doDelete(record, index, event) {
        if (null != event) g_key = record.key;

        const {deleteFoodDetails, numberFoodDetails} = this.props;
        if (index == "change") {
            numberFoodDetails(this.props.nowDeskNumber, g_key, record);
        }
        else if (null != record && event.target.tagName == "A") {
            if (event.target.innerHTML == "删除")
                deleteFoodDetails(this.props.nowDeskNumber, record.key);
            else if (event.target.innerHTML == "上菜") {
                g_stats = 2;
                if (record['orderID'] != null) {
                    const {submitFood} = this.props;

                    console.log(this.props.orderState);
                    let deskNumber = this.props.nowDeskNumber;
                    for (let i = this.props.orderState.length - 1, index = 0; i >= index; i--) {
                        if (deskNumber == this.props.orderState[i].deskNum) {
                            orderId = this.props.orderState[i].deskInfo.data.id;
                            orderNumber = this.props.orderState[i].deskInfo.data.oNum;
                            orderTime = this.props.orderState[i].deskInfo.data.oDate;

                        }
                    }
                    submitFood(record['orderID'], orderId);
                }

            }
        }
    }

    onChange(value) {
        console.log('菜品改变数量了：', value);
        this.doDelete(value, "change");
    }

    summitOrder() {
        let data = {
            deId: this.props.nowDeskNumber,
            oTotal: sumPrice,
            odCount: foodNum,
            orderItemList: [],
        };
        for (let i = 0; i < this.props.getDeskFoodArray.length; i++) {
            data.orderItemList.push({
                dId: this.props.getDeskFoodArray[i].FoodID,
                oiCount: this.props.getDeskFoodArray[i].nowNum,
            });
        }
        const {pushOrder} = this.props;
        pushOrder(data);

    }

    endOrder(orderNumber) {
        const {endOrder, ClearStoreBydeskNumber} = this.props;

        if (orderNumber != null) {
            endOrder(orderNumber, this.props.nowDeskNumber);
            success('您已成功结账！');
            //删除储存的信息
            ClearStoreBydeskNumber(this.props.nowDeskNumber);

            //指定目前桌号为空
            this.nowDeskNumber(null);
        } else {
            error("错误！");
        }


    }

    submitFood(record) {
        const {submitFood} = this.props;
        console.log(record);
        if (record['orderID'] != null)
            submitFood(record['orderID'], orderId);
    }

    render() {
        orderNumber = '';
        orderTime = '';
        orderId = '';
        let ScreenHeight = document.body.clientHeight - 104; //获取 全屏幕减去title的高度
        let deskNumber = this.props.nowDeskNumber;
        const {ClearStoreByOrderSE} = this.props;
        //提交订单后的状态判定
     if(this.props.putOrderSE==false){
         if(this.props.dishOrderSE.msg==1){   //如果是 1 ，则提示此桌被占用
             warning("此桌已经被占用！","抱歉！");
         }else if(this.props.dishOrderSE.msg!=null){
             let msg=JSON.parse(this.props.dishOrderSE.msg);
             let msgText=[];
             for(let i=0,index=msg.length;i<index;i++){
                 msgText[i]="菜品："+msg[i].dName+"不足！目前剩余"+Number(msg[i].dCount)+"份！\n";
             }

             error(msgText,"菜品不足！");
             //清空 订单 成功失败信息
         }else if(this.props.dishOrderSE.msg==null){
             warning("请选择桌号以及点餐再提交订单！","抱歉！");
         }
         //清空订单报错信息
         ClearStoreByOrderSE();
     }else if(this.props.putOrderSE==true){
           success("成功提交订单！");
         //清空 订单 成功失败信息
         ClearStoreByOrderSE();
     }

        if (this.props.getDeskFoodArray != null) {
            for (let i = 0, index = this.props.getDeskFoodArray.length; i < index; i++) {
                if (null != this.props.getDeskFoodArray[i]) {
                    sumPrice += Number(this.props.getDeskFoodArray[i].Price * this.props.getDeskFoodArray[i].nowNum);
                    foodNum += Number(this.props.getDeskFoodArray[i].nowNum);
                    console.log(this.props.getDeskFoodArray[i].Price);
                }
            }
        }

        if (this.props.orderState != null) {
            g_stats = 0;  //初始化状态为购物车
            for (let i = 0, index = this.props.orderState.length; i < index; i++) {
                if (this.props.orderState[i] != null) {
                    if (deskNumber == this.props.orderState[i].deskNum) {
                        if (this.props.orderState[i].deskInfo != null) {
                            g_stats = 1;   //状态为订单明细
                            orderId = this.props.orderState[i].deskInfo.data.id;
                            orderNumber = this.props.orderState[i].deskInfo.data.oNum;
                            orderTime = this.props.orderState[i].deskInfo.data.oDate;
                        } else {
                            g_stats = 0;
                            orderId = '';
                            orderNumber = '';
                            orderTime = '';
                        }
                    }
                } else {
                    g_stats = 0;
                    orderId = '';
                    orderNumber = '';
                    orderTime = '';
                }

            }
        }

        let listColumns = [{
            title: '菜品名',
            dataIndex: 'FoodName',
            key: 'name',
        }, {
            title: '数量(份)',
            dataIndex: 'nowNum',
            key: 'nownum',
            render: text => <InputNumber min={1} max={100} value={text} onChange={this.onChange}/>,
        }, {
            title: '单价',
            dataIndex: 'Price',
            key: 'price',
            render: text => <span>{text}¥</span>,
        }, {
            title: '操作',
            dataIndex: 'func',
            key: 'func',
            render: text => <a>删除</a>,
        },
        ];
        if (g_stats == 1) {
            listColumns = [{
                title: '菜品名',
                dataIndex: 'FoodName',
                key: 'name',
            }, {
                title: '数量(份)',
                dataIndex: 'nowNum',
                key: 'nownum',
            }, {
                title: '单价',
                dataIndex: 'Price',
                key: 'price',
                render: text => <span>{text}¥</span>,
            }, {
                title: '操作',
                dataIndex: 'func',
                key: 'func',
                render: (text, record, index) =>
                    <a onClick={(record) => this.submitFood(record)}>{text}</a>,

            },
            ];
        }
        let dataArray = this.props.getDeskFoodArray;
        if (g_stats == 2) {
            dataArray = this.props.newGetDeskFoodArray;

        }
        let submitButton = null;
        let endOrderButton = "disabled";
        if (g_stats == 1) {
            submitButton = "disabled";
            endOrderButton = null;
            let fromStoredataArray = this.props.afterEndFoodArray.orderItemList;
            console.log(fromStoredataArray);
            if (fromStoredataArray != null) {
                for (let i = 0, index = dataArray.length; i < index; i++) {
                    if (fromStoredataArray[i] != null) {
                        dataArray[i].orderID = fromStoredataArray[i].id;
                        dataArray[i].foodStats = fromStoredataArray[i].oiStatus;
                        if (dataArray[i].foodStats == "未上菜" || dataArray[i].foodStats == 0) dataArray[i].func = "上菜";
                        else dataArray[i].func = "√";
                    }


                }
            }

        }


        return (
            <div>
                <Card title="订单明细区" bodyStyle={{width: '100%', height: ScreenHeight}} className="orderDetails">
                    <table className="listInfoOrdering titleTable">
                        <tbody>
                        <tr className="listTableImportant">
                            <td>桌号</td>
                            <td>{deskNumber}</td>
                        </tr>
                        <tr>
                            <td>订单号</td>
                            <td>{orderNumber}</td>
                        </tr>
                        <tr>
                            <td>下单时间</td>
                            <td>{orderTime}</td>
                        </tr>
                        </tbody>
                    </table>
                    <hr className="doLineOrdering"/>
                    <div className="heightDo">
                        <Table
                            columns={listColumns}
                            dataSource={dataArray}
                            pagination={false}
                            className="listInfoOrdering infoTable"
                            size="small"
                            onRowClick={(record, index, event) => this.doDelete(record, index, event)}
                        />
                    </div>
                    <hr className="doLineOrdering"/>
                    <section className="doCenter">
                        <span style={{fontSize: 14}}>共计金额：{sumPrice}¥ </span><br/>
                        <span style={{fontSize: 14}}> 点餐量：{foodNum}份</span>


                    </section>
                    <section className="detailsButton">
                        <Button type="primary" size="large" onClick={this.summitOrder}
                                disabled={submitButton}>提交订单</Button>
                        <Button type="primary" size="large" onClick={() => this.endOrder(orderId)}
                                disabled={endOrderButton}>结账</Button>
                    </section>
                </Card>
            </div>
        );
    }
}

const mapStateToProps = (state) => {
    foodNum = 0;
    sumPrice = 0;
    let nowDeskNumber = state.httpData.deskNumber;

    let afterEndFoodArray = {};
    if (nowDeskNumber == null) nowDeskNumber = 0;
    if (state.httpData.orderState != null) {
        for (let i = 0, index = state.httpData.orderState.length; i < index; i++) {
            if (state.httpData.orderState[i] != null) {
                if (state.httpData.deskNumber == state.httpData.orderState[i].deskNum) {
                    if (state.httpData.orderState[i].deskInfo != null) {
                        afterEndFoodArray = state.httpData.orderState[i].deskInfo.data;
                        console.log(state.httpData.orderState);
                    }

                }
            }

        }
    }
    if(state.httpData.OKType.Order_SE== false){
        error("上菜失败！余量不足！");
       state.httpData.OKType.Order_SE=true;
    }
    console.log(state.httpData.orderState);

    putOrderSE=null;
    if(state.httpData.OKType.dishOrderSE!=null){
        putOrderSE=state.httpData.OKType.dishOrderSE.success;
    }
    return {

        nowDeskNumber: state.httpData.deskNumber,
        getDeskFoodArray: state.httpData.deskTable[nowDeskNumber].foodArray,
        orderState: state.httpData.orderState,
        afterEndFoodArray: afterEndFoodArray,
        OKTypeOrderSE:state.httpData.OKType.Order_SE,
        dishOrderSE:state.httpData.OKType.dishOrderSE,
        putOrderSE:putOrderSE,
    };
};
//connect 实现， mapStateToProps将state传入props，参数2 将 action 作为 props 绑定到 MyComp 上
SelectFood = connect(mapStateToProps, {
    deleteFoodDetails,
    numberFoodDetails,
    pushOrder,
    endOrder,
    pointNowDesk,
    submitFood,
    ClearStoreBydeskNumber,
    ClearStoreByOrderSE
})(SelectFood);


export default SelectFood;

/**
 * Created by Knove on 2017/11/13.
 *  描述：制造桌子的工厂
 */
import React from 'react';
import {Card, Spin} from 'antd';
import {connect} from 'react-redux'; // 引入connect
import {pointNowDesk, deskSearch} from '../../action/action';

const gridStyle = {
    width: '60px',
    background: '#919191',
    padding: '13px 47px 13px 39px',
    margin: 5,
    color: '#fbfbfb',
    lineHeight: '5px',
    textAlign: 'center',
    cursor: 'pointer',

};
let loading = true;

class DeskFactory extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            nowClassName: '',
        };
        this.nowDeskNumber = this.nowDeskNumber.bind(this);
        this.handleGetDeskAll = this.handleGetDeskAll.bind(this);


        this.handleGetDeskAll();
    }

    handleGetDeskAll() {
        const {deskSearch} = this.props;
        deskSearch();
    }

    nowDeskNumber(number) {
        const {pointNowDesk} = this.props;
        pointNowDesk(number);
        console.log("现在指定的桌号为：" + number);
        this.setState({
            nowClassName: number,
        });
    }

    render() {
        if (this.props.loading) loading = false;
        const desk = new Array();
        let searchDeskNumber = this.props.deskNumber;  //搜索得到的桌子号
        console.log("【桌子工厂】搜索得到的桌子号=" + (searchDeskNumber == ''));

        for (let i = 0, len = this.props.nowAllDeskNumber; i < len; i++) {
            desk.push(i);
        }
        let factory = null;
        if (this.props.nowDeskInfo != null) {
            let array = this.props.nowDeskInfo;
            console.log("获取到目前的桌子情况:");
            console.log(array);

            factory = array.map((item, index) => {
                let number = index + 1;
                if ((searchDeskNumber != '' && !String(number).indexOf(searchDeskNumber)) || searchDeskNumber == '') {
                    if (item.deStatus != 0) {
                        return <Card.Grid style={gridStyle} className="deskError"
                                          onClick={number => this.nowDeskNumber(index + 1)}>{number}</Card.Grid>;
                    } else if (this.state.nowClassName == number) {
                        return <Card.Grid style={gridStyle} className="deskSelect"
                                          onClick={number => this.nowDeskNumber(index + 1)}>{number}</Card.Grid>;
                    } else
                        return <Card.Grid style={gridStyle}
                                          onClick={number => this.nowDeskNumber(index + 1)}>{number}</Card.Grid>;
                }


            });
        }
        return (
            <Spin size="large" spinning={loading}>
                <Card noHovering bordered={false} className="factoryFood largeFactory">
                    {factory}
                </Card>
            </Spin>
        );
    }
}

const mapStateToProps = (state) => {
    let count = 0;  //全部桌子 的数量
    for (let i in state.httpData.deskInfo) {
        count++;
    }
    return {
        nowDeskNumber: state.httpData.deskNumber,
        nowDeskInfo: state.httpData.deskInfo,
        nowAllDeskNumber: count,
        orderState: state.httpData.orderState,
        loading: state.httpData.foodSuccess,

    };
};
//connect 实现， mapStateToProps将state传入props，参数2 将 action 作为 props 绑定到 MyComp 上
DeskFactory = connect(mapStateToProps, {pointNowDesk, deskSearch})(DeskFactory);

export default DeskFactory;

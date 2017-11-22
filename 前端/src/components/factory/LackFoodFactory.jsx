/**
 * Created by Knove on 2017/11/13.
 *  描述：制造余量不足菜品的工厂
 */
import React from 'react';
import {Card, Spin, Modal} from 'antd';
import {connect} from 'react-redux'; // 引入connect
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

function error() {
    Modal.error({
        title: '抱歉',
        content: '本菜品已经售空！',
    });
}

let loading = true;

class LackFoodFactory extends React.Component {

    render() {
        if (this.props.loading) loading = false;
        let factory = null;
        if (this.props.foodMain != null) {
            factory = this.props.foodMain.map(function (item) {
                if (item.dCount == 0) return <Card.Grid
                    className="foodButton lackFood">{item.dName} {item.dPrice}¥</Card.Grid>;
            });
        }
        return (
            <Spin size="large" spinning={loading}>
                <Card noHovering className="factoryFood smallFactory" bordered={false}>
                    {factory}
                </Card>
            </Spin>
        );
    }
}

const mapStateToProps = (state) => {

    return {
        foodMain: state.httpData.foodTable,
        loading: state.httpData.foodSuccess,
    };
};
//connect 实现， mapStateToProps将state传入props，参数2 将 action 作为 props 绑定到 MyComp 上
LackFoodFactory = connect(mapStateToProps)(LackFoodFactory);

export default LackFoodFactory;

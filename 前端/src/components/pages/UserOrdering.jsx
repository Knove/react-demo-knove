/**
 * Created by Knove on 2017/11/9.
 */
import React from 'react';
import PendOrder from './OrderingComponents/PendOrder';
import SelectFood from './OrderingComponents/SelectFood';
import LackFood from './OrderingComponents/LackFood';
import OrderDetails from './OrderingComponents/OrderDetails';
import {connect} from 'react-redux'; // 引入connect
import {initOrdering} from '../../action/action';

class UserOrdering extends React.Component {
    constructor(props) {
        super(props);
        this.state = {};
        const {initOrdering} = this.props;
        initOrdering();
    }

    render() {
        let ScreenHeight = document.body.clientHeight - 110; //获取 全屏幕减去title的高度
        return (
            <div className="orderingMain">
                <section className="mainLeft">
                    <PendOrder/>
                </section>
                <section className="mainCenter" style={{height: ScreenHeight}}>
              {/*      <LackFood style={{height: '30%'}}/>*/}
                    <SelectFood style={{height: '70%'}}/>
                </section>
                <section className="mainRight">
                    <OrderDetails/>
                </section>
            </div>
        );
    }
}

const mapStateToProps = (state) => {
    return {
        nowDeskNumber: state.httpData.deskNumber,

    };
};
//connect 实现， mapStateToProps将state传入props，参数2 将 action 作为 props 绑定到 MyComp 上
UserOrdering = connect(mapStateToProps, {initOrdering})(UserOrdering);


export default UserOrdering;

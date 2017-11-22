/**
 * Created by Knove on 2017/11/11.
 *  描述：Info页面的Tab栏
 */
import React from 'react';
import {hashHistory} from 'react-router';

function doPageA() {
    hashHistory.push({
        pathname: 'main/OrderInfo',
    });
}

function doPageB() {
    //hashHistory实现类似get方法带参数跳转
    hashHistory.push({
        pathname: 'main/FoodInfo',
    });
}

class InfoTab extends React.Component {

    render() {
        let classNowA = "infoTab";
        let classNowB = "infoTab";
        const infoNum = this.props.infoNum;
        if (infoNum == 1) classNowA = classNowA + " infoActive";
        else classNowB = classNowB + " infoActive";

        return (
            <div>
                <div className={classNowA} onClick={doPageA}>
                    <span>订单信息</span>
                </div>
                <div className={classNowB} onClick={doPageB}>
                    <span>菜品信息</span>
                </div>
            </div>
        );
    }
}

export default InfoTab;

/**
 * Created by Knove on 2017/11/13.
 *  描述：服务员订餐页面的余量不足菜品选项卡
 */
import React from 'react';
import { Card } from 'antd';
import LackFoodFactory from "../../factory/LackFoodFactory";
class LackFood extends React.Component{


    render(){

        let ScreenHeight=document.body.clientHeight-145; //获取 全屏幕减去title的高度
        return(
            <div >
                <Card title="售空菜品区"  bodyStyle={{ width: '100%',height:0.15*ScreenHeight }} >
                    <LackFoodFactory/>
                </Card>
            </div>
        )
    }
}
export default LackFood;

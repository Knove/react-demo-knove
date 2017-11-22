/**
 * Created by Knove on 2017/11/13.
 *  描述：服务员订餐页面的待处理订单选项卡
 */
import React from 'react';
import {Card, Input} from 'antd';
import DeskFactory from '../../factory/DeskFactory';

let inputNumber = null;

class PendOrder extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            inputNumber: '',
        };
        this.doSearch = this.doSearch.bind(this);
    }

    doSearch(value) {
        inputNumber = value.target.value;
        this.setState({
            inputNumber: inputNumber,
        });
        console.log("正在搜索桌号：" + inputNumber + ", Type=" + typeof inputNumber);


    }

    render() {
        const Search = Input.Search;
        let ScreenHeight = document.body.clientHeight - 104; //获取 全屏幕减去title的高度


        return (
            <div>
                <Card title="选桌区" bodyStyle={{width: '100%', height: ScreenHeight}}>
                    <Search
                        ref="search"
                        placeholder="输入桌号"
                        style={{width: '100%'}}
                        /* onSearch={value=>this.doSearch(value)}*/
                        onChange={value => this.doSearch(value)}
                    />
                    <DeskFactory deskNumber={this.state.inputNumber}/>

                </Card>
            </div>
        );
    }
}

export default PendOrder;

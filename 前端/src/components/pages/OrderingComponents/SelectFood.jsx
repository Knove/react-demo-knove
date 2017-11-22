/**
 * Created by Knove on 2017/11/13.
 *  描述：服务员订餐页面的
 */
import React from 'react';
import {Card, Input, Tabs, Select} from 'antd';
import TypeFactory from "../../factory/TypeFactory";

const TabPane = Tabs.TabPane;
const Option = Select.Option;

function changeTabPosition(tabPosition) {
    this.setState({tabPosition});
}

let inputNumber = null;

class SelectFood extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            inputNumber: '',
        };
        this.doSearch = this.doSearch.bind(this);
    }

    doSearch(value) {
        inputNumber = value.target.value.toUpperCase();
        this.setState({
            inputNumber: inputNumber,
        });
        console.log("正在搜索菜品汉字母：" + inputNumber + ", Type=" + typeof inputNumber);


    }

    render() {
        let ScreenHeight = document.body.clientHeight - 104; //获取 全屏幕减去title的高度
        const Search = Input.Search;
        return (
            <Card title="选餐区" bodyStyle={{width: '100%', height: 1 * ScreenHeight}}>
                <Search
                    ref="search"
                    placeholder="请输菜品汉拼首字母"
                    style={{width: '100%'}}
                    onChange={value => this.doSearch(value)}
                />


                <TypeFactory foodShort={this.state.inputNumber}/>

            </Card>
        );
    }
}

export default SelectFood;

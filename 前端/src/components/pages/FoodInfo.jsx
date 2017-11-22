/**
 * Created by Knove on 2017/11/9.
 */
import React from 'react';
import moment from 'moment';
import InfoTab from './InfoComponents/InfoTab';
import {dataSearch, foodInit, addFood, deleteFood, uploadFood} from '../../action/action';
import {connect} from 'react-redux'; // 引入connect
import {Table, Icon, DatePicker, Input, Button, Modal, Form, Select} from 'antd';

const {TextArea} = Input;
const {RangePicker} = DatePicker;
const FormItem = Form.Item;
const Option = Select.Option;
let g_date;
let g_date1;
let g_index = {};

const InfoForm = Form.create()(
    props => {
        const {visible, onCancel, onOk, form} = props;
        const {getFieldDecorator, getFieldProps} = form;

        function handleChange1(value) {
            console.log(`selected ${value}`);
        }

        return (
            <Modal
                onOk={onOk}
                onCancel={onCancel}
                visible={visible}
                title={"添加菜品"}
            >
                <Form layout={"horizontal"}>
                    <FormItem label={"菜品名称"} layout={"horizontal"}>
                        {getFieldDecorator("dName", {
                            rules: [{required: true, message: "菜品名称不能为空"}],
                        })(<Input/>)}
                    </FormItem>
                    <FormItem label={"菜品单价"}>
                        {getFieldDecorator("dPrice", {
                            rules: [{required: true, message: "菜品单价不能为空"}],
                        })(<Input/>)}
                    </FormItem>
                    <FormItem label={"菜品余量"}>
                        {getFieldDecorator("dCount", {
                            rules: [{required: true, message: "菜品余量不能为空"}],
                        })(<Input/>)}
                    </FormItem>
                    <FormItem label={"汉拼首字母"}>
                        {getFieldDecorator("dCn", {
                            rules: [{required: true, message: "汉拼首字母不能为空"}],
                        })(<Input/>)}
                    </FormItem>
                    <FormItem label={"所属类别"}>
                        {getFieldDecorator("dcId", {
                            rules: [{required: true, message: "所属类别不能为空"}],
                        })(<Select style={{width: 260, marginLeft: 12}} onChange={handleChange1}>
                            <Option value="1">特价菜品</Option>
                            <Option value="2">热销菜品</Option>
                            <Option value="3">饮料</Option>
                            <Option value="4">荤菜</Option>
                            <Option value="5">素菜</Option>
                            <Option value="6">汤类</Option>
                            <Option value="7">面食</Option>
                        </Select>)}
                    </FormItem>
                    <FormItem label={"原料"}>
                        {getFieldDecorator("dMaterial")(<TextArea/>)}
                    </FormItem>
                    <FormItem label={"备注"}>
                        {getFieldDecorator("dRemark")(<TextArea/>)}
                    </FormItem>
                    <FormItem
                        wrapperCol={{span: 12, offset: 6}}
                    >
                    </FormItem>
                </Form>
            </Modal>
        );
    },
);


class FoodInfo extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            visible: false,
            visible1: false,
            value: "",
            value_price: "",
            value_count: "",
            value_material: "",
            value_remark: "",
        };
        this.showModal = this.showModal.bind(this);
        this.handleOk = this.handleOk.bind(this);
        this.handleCancel = this.handleCancel.bind(this);
        this.saveFormRef = this.saveFormRef.bind(this);

        this.showModal1 = this.showModal1.bind(this);
        this.handleOk1 = this.handleOk1.bind(this);
        this.handleCancel1 = this.handleCancel1.bind(this);
        this.handleChange = this.handleChange.bind(this);
        this.handleChange1 = this.handleChange1.bind(this);
        this.handleChange2 = this.handleChange2.bind(this);
        this.handleChange3 = this.handleChange3.bind(this);
        this.handleChange4 = this.handleChange4.bind(this);
        this.handleSearch = this.handleSearch.bind(this);
        this.handleDelete = this.handleDelete.bind(this);
        const {foodInit} = this.props;
        foodInit();
        this.setColor = this.setColor.bind(this);

    }

    //添加菜品
    showModal() {
        this.setState({
            visible: true,
        });
    }

    saveFormRef(form) {
        this.form = form;
    }

    handleOk(e) {
        const form = this.form;
        const {addFood} = this.props;
        addFood(form.getFieldsValue());

        form.validateFields((err, value) => {
            if (err)
                return;
            form.resetFields();
            this.setState({
                visible: false,
            });
        });
    }

    handleCancel(e) {
        console.log(e);
        this.setState({
            visible: false,
        });
    }

    //修改菜品信息
    showModal1(record) {
        this.setState({
            visible1: true,
        });
        g_index = record;
        this.state.value_price = g_index.dPrice;
        this.state.value_count = g_index.dCount;
        this.state.value_material = g_index.dMaterial;
        this.state.value_remark = g_index.dRemark;
    }

    handleOk1(e) {
        // e.preventDefault();
        g_index.dPrice = this.state.value_price;
        g_index.dCount = this.state.value_count;
        g_index.dMaterial = this.state.value_material;
        g_index.dRemark = this.state.value_remark;
        const {uploadFood} = this.props;
        uploadFood(g_index);
        console.log(g_index);
        this.setState({
            visible1: false,
        });

    }

    handleCancel1(e) {
        this.setState({
            visible1: false,
        });
    }

    //修改value值
    handleChange(e) {
        this.setState({
            value: e.target.value,
        });
    }

    handleChange1(e) {
        this.setState({
            value_price: e.target.value,
        });
    }

    handleChange2(e) {
        this.setState({
            value_count: e.target.value,
        });
    }

    handleChange3(e) {
        this.setState({
            value_material: e.target.value,
        });
    }

    handleChange4(e) {
        this.setState({
            value_remark: e.target.value,
        });
    }

    handleSearch(e) {
        e.preventDefault();
        let data = {
            dName: this.state.value,
            sdDate: g_date,
            edDate: g_date1,
        };
        const {dataSearch} = this.props;
        dataSearch(data);
    }

    handleDelete(id) {
        console.log(id);
        const {deleteFood} = this.props;
        deleteFood(id);
    }

    setColor(record) {
        console.log(record);
        if (record.dCount == 0) {
            return " bgRed";
        }
        if (record.dCount < 11) {
            return " bgYellow";
        }
        return "";
    }

    render() {
        let loading = true;
        if (this.props.loading)
            loading = false;

        function onChange(date, dateString) {
            g_date = dateString[0];
            g_date1 = dateString[1];
        }

        const columns = [{
            title: '菜品名称',
            dataIndex: 'dName',
        }, {
            title: '菜品单价',
            dataIndex: 'dPrice',
        }, {
            title: '菜品余量',
            dataIndex: 'dCount',
        }, {
            title: '上架日期',
            dataIndex: 'dDate',
        }, {
            title: '汉拼首字母',
            dataIndex: 'dCn',
        }, {
            title: '所属类别',
            dataIndex: 'dcId',
        }, {
            title: '原料',
            dataIndex: 'dMaterial',
        }, {
            title: '备注',
            dataIndex: 'dRemark',
        }, {
            title: '操作',
            dataIndex: 'opera',
            render: (text, record, index) =>
                <span>
                    <a onClick={() => this.showModal1(record)}>编辑</a>
                    <span className="ant-divider"/>
                    <a onClick={() => this.handleDelete(record.id)}>删除</a>
                </span>,
        }];


        return (
            <div>
                <InfoTab infoNum="2"/>
                <div className="funcTitle">
                    <div className="smallInput">
                        菜品名称<Input className="datePicker" value={this.state.value} onChange={this.handleChange}/>
                    </div>
                    <div className="smallInput">
                        上架时间<RangePicker onChange={onChange} className="datePicker"/>
                    </div>
                    <div className="smallInput">
                        <Button type="primary" icon="search" onClick={this.handleSearch}>查询</Button>
                    </div>
                    <div>
                        <Button type="primary" onClick={this.showModal}><Icon type="plus"/>添加菜品</Button>
                    </div>
                </div>
                <div className="tableMain clearFix">
                    <span className="tableDate">菜品种类数：<span className="tableMoney">{this.props.foodSum}种</span></span>
                    <span className="tableDate">|</span>
                    <span className="tableDate">售空菜品数：<span className="tableMoney">{this.props.nullCount}种</span></span>
                    <span className="tableDate">|</span>
                    <span className="tableDate">余量不足菜品数：<span
                        className="tableMoney">{this.props.lowCount}种</span></span>
                    <span className="tableRight">
                       <div><span className="redLine"></span>已售空菜品</div>
                       <div><span className="yellowLine"></span>余量不足菜品</div>
                    </span>
                    <Table
                        dataSource={this.props.foodMain}
                        columns={columns} size={"small"}
                        loading={loading}
                        pagination={{pageSize: 5}}
                        rowClassName={(record) => this.setColor(record)}/>
                    <InfoForm
                        ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onOk={this.handleOk}
                    />
                    <Modal
                        title="编辑菜品信息"
                        visible={this.state.visible1}
                        onCancel={this.handleCancel1}
                        onOk={this.handleOk1}
                        footer={[
                            <Button type="primary" onClick={this.handleCancel1}>取消</Button>,
                            <Button type="primary" onClick={this.handleOk1}>确定</Button>,
                        ]}
                    >
                        <div className="editInfo">
                            <div>菜品名称： {g_index.dName}</div>
                            <div>菜品单价：<Input type="text" value={this.state.value_price}
                                             onChange={this.handleChange1}></Input></div>
                            <div>菜品余量：<Input type="text" value={this.state.value_count}
                                             onChange={this.handleChange2}></Input></div>
                            <div className="clearFix">
                                <span>菜品原料：</span>
                                <TextArea value={this.state.value_material} onChange={this.handleChange3}></TextArea>
                            </div>
                            <div className="clearFix">
                                <span>菜品备注：</span>
                                <TextArea value={this.state.value_remark} onChange={this.handleChange4}></TextArea>
                            </div>
                        </div>
                    </Modal>
                </div>
            </div>
        );
    }
}

const mapStateToProps = (state) => {
    //获取菜品总数
    let count = 0;
    //获取已售空菜品总数
    let nullCount = 0;
    //获取余量不足菜品数
    let lowCount = 0;
    //获取菜品信息
    let dish = {};

    for (let i in state.httpData.foodTable) {
        count++;
        if (state.httpData.foodTable[i].dCount == 0) {
            nullCount++;
        } else if (state.httpData.foodTable[i].dCount > 0 && state.httpData.foodTable[i].dCount < 50) {
            lowCount++;
        }
    }
    return {
        foodMain: state.httpData.foodTable,
        loading: state.httpData.success,
        foodSum: count,
        nullCount: nullCount,
        lowCount: lowCount,
    };
};
FoodInfo = connect(mapStateToProps, {foodInit, dataSearch, addFood, deleteFood, uploadFood})(FoodInfo);
//后面的FoodInfo是UI组件，前面的FoodInfo是通过connect生成的容器组件
export default FoodInfo;

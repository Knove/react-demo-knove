/**
 * Created by Knove on 2017/11/9.
 */
import React, { Component } from 'react';
import { Router, Route, hashHistory, IndexRedirect } from 'react-router';
import FoodInfo from '../components/pages/FoodInfo';
import OrderInfo from '../components/pages/OrderInfo';
import UserOrdering from '../components/pages/UserOrdering';
import Title from '../components/ui/title';
import App from '../components/ui/App';
export default class CRouter extends Component {
    render() {
        return (
            <Router history={hashHistory}>

                    <Route path={'/'} components={App} >
                        <IndexRedirect to="/main/UserOrdering"/>
                        <Route path={'main'} components={Title}>
                            <Route path={'FoodInfo'} components={FoodInfo} />
                            <Route path={'UserOrdering'} components={UserOrdering} />
                            <Route path={'OrderInfo'} components={OrderInfo} />
                        </Route>
                    </Route>

            </Router>
        )
    }
}

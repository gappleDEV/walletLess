import React, { Component } from 'react';
import { Route, NavLink, HashRouter } from 'react-router-dom';
import Home from './Home';
import Users from './Users';
import Login from './Login';

class Main extends Component{
    render() {
        return (
            <HashRouter>
                <div>
                    <h1>Walletless</h1>
                    <ul className="header">
                        <li><NavLink exact to="/">Home</NavLink></li>
                        <li><NavLink to="/users">Users</NavLink></li>
                        <li><NavLink to="/login">Login</NavLink></li>
                    </ul>
                    <div className="content">
                        <Route exact path="/" component={Home}/>
                        <Route path="/users" component={Users}/>
                        <Route path="/login" component={Login}/>
                    </div>
                </div>
            </HashRouter>
        );
    }
}

export default Main;
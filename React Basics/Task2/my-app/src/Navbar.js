import React, { Component } from "react";
import './Navbar.css';
import logo from './images/logo.png'; // Tell webpack this JS file uses this image
export default class Navbar extends Component {
    render() {
        return (
            <div className="nav_contain">
                <div class="logo">
                    <img src={logo} alt="logo"/>
                </div>
                <div class="menu">
                    <ul>
                        <li><a href="Men.html">Men</a></li>
                        <li><a href="Women.html">Women</a></li>
                        <li><a href="Kids.html">Kids</a></li>
                        <li><a href="checkout.html">Accessories</a></li>

                    </ul>
                </div>
            </div>
        );
    }
}
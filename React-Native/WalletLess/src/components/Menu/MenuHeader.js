import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    Image,
    StyleSheet
} from 'react-native';
import FontAwesome, { Icons } from 'react-native-fontawesome';

// Common Styles
import { c } from '../../styles/common';

export default class MenuHeader extends Component {

    months = ["January", "February", "March", "April", "May", "June", 
    "July", "August", "September", "October", "November", "December"];

    today = new Date();

    render() {
        return (
            <View style={styles.banner}>
                <View style={styles.container}>
                    <Text style={styles.helloText}>Hello, {this.props.name}!</Text>
                    <Text style={styles.dateText}>{this.months[this.today.getMonth()] + " " + this.today.getDate() + ", " + this.today.getFullYear() + " (ID: " + this.props.userId + ")"}</Text>
                </View>
                <View style={styles.center}>
                    <Image source={require('./../../images/Logo.png')} style={styles.image} />
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    banner: {
        backgroundColor: c.gray4.backgroundColor,
        height: 80,
        paddingTop: 5,
        flexDirection: 'row'
    },
    container: {
        flex: 3,
        paddingLeft: 10
    },
    helloText: {
        color: c.gray1.color,
        height: 38,
        fontSize: 32,
        fontWeight: '200',
    },
    dateText: {
        color: c.gray3.color,
        fontSize: 18,
        fontWeight: '200'
    },
    center: {
        flex: 1,
        alignItems: 'center',
    },
    image: {
        width: 70,
        height: 70
    }
})
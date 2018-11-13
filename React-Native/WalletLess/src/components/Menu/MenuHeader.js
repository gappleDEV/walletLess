import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet
} from 'react-native';
import FontAwesome, { Icons } from 'react-native-fontawesome';

export default class MenuHeader extends Component {

    months = ["January", "February", "March", "April", "May", "June", 
    "July", "August", "September", "October", "November", "December"];

    today = new Date();

    render() {
        return (
            <View style={styles.banner}>
                <View style={styles.container}>
                    <Text style={styles.helloText}>Hello, {this.props.name}!</Text>
                    <Text style={styles.dateText}>{this.months[this.today.getMonth()] + " " + this.today.getDate() + ", " + this.today.getFullYear()}</Text>
                </View>
                <View style={styles.center}>
                    <FontAwesome style={styles.icon}>{Icons.userCircleO}</FontAwesome>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    banner: {
        backgroundColor: '#c0c0c0',
        height: 80,
        paddingTop: 5,
        flexDirection: 'row'
    },
    container: {
        flex: 4,
        paddingLeft: 10
    },
    helloText: {
        color: '#efefef',
        height: 38,
        fontSize: 32,
        fontWeight: '200',
        //paddingBottom: 10
    },
    dateText: {
        color: '#efefef',
        fontSize: 16,
        fontWeight: '400'
    },
    center: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    icon: {
        fontSize: 48,
        color: '#efefef'
    }
})
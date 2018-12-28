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
                    {/* <FontAwesome style={styles.icon}>{Icons.userCircleO}</FontAwesome> */}
                    <Image source={require('./../../images/Logo.png')} style={styles.image} />
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    banner: {
        backgroundColor: '#2F3C51',
        height: 80,
        paddingTop: 5,
        flexDirection: 'row'
    },
    container: {
        flex: 4,
        paddingLeft: 10
    },
    helloText: {
        color: '#AFB6C0',
        height: 38,
        fontSize: 32,
        fontWeight: '200',
        //paddingBottom: 10
    },
    dateText: {
        color: '#AFB6C0',
        fontSize: 18,
        fontWeight: '200'
    },
    center: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    image: {
        width: 70,
        height: 70
    },
    icon: {
        fontSize: 48,
        color: '#efefef'
    }
})
import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet
} from 'react-native';

export default class Card extends Component {


    render() {
        return (
            <View style={styles.center}>
                <View style={[styles.cardView, 
                    {borderRadius: this.props.borRadius, 
                    borderLeftWidth: this.props.lborWidth, 
                    borderLeftColor: this.props.lborColor,
                    width: this.props.myWidth,
                    height: this.props.myHeight,
                    paddingBottom: this.props.padBot,
                    marginTop: this.props.marTop,
                    marginBottom: this.props.marBot}]}>
                    {this.props.children}
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    cardView: {
        paddingLeft: 10,
        //paddingRight: 10,
        paddingTop: 5,
        paddingBottom: 5,
        borderColor: 'rgb(240, 240, 240)',
        backgroundColor: '#5F6368',
        shadowOpacity: 0.3,
        shadowRadius: 3,
        shadowOffset: {
            height: 3,
            width: 3
        }
    },
    center: {  
        justifyContent: 'center',
        alignItems: 'center'
    }
});
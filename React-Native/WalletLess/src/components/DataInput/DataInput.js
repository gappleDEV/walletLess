import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet
} from 'react-native';
import FloatingLabelInput from './../FloatingLabelInput/FloatingLabelInput';
import FontAwesome, { Icons } from 'react-native-fontawesome';

export default class DataInput extends Component {

    render() {
        return (
            <View>
                <FloatingLabelInput
                    label="First Name"
                    value="" />
                <FloatingLabelInput
                    label="Middle Name" 
                    value="" />
                <FloatingLabelInput
                    label="Last Name" 
                    value="" />
            </View>
        );
    }
}
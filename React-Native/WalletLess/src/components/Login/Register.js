import React, { Component } from 'react';
import {
    View,
    Text,
    TouchableHighlight,
    StyleSheet,
} from 'react-native';
import FloatingLabelInput from './../FloatingLabelInput/FloatingLabelInput';
import FontAwesome, { Icons } from 'react-native-fontawesome';

import Card from '../Card/Card';

export default class Register extends Component {

    render() {

        const { navigation } = this.props;
        //const sections = navigation.getParam('sections', {});

        return (
            <View style={styles.dataInputContainer}>
                <Card myWidth={350} borRadius={10} padBot={20} marBot={20} marTop={5}>
                    <FloatingLabelInput
                        label='Email'
                        dataName='email'
                        value=""
                    />
                </Card>
                <Card myWidth={350} borRadius={10} padBot={20} marBot={20} marTop={5}>
                    <FloatingLabelInput
                        label='Password'
                        dataName='password'
                        value=""
                    />
                </Card>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    dataInputContainer: {
        flex: 1
    }
});
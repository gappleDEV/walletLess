import React, { Component } from 'react';
import {
    View,
    Text,
    TouchableHighlight,
    Image,
    StyleSheet,
} from 'react-native';
import FloatingLabelInputIcon from './../FloatingLabelInput/FloatingLabelInputIcon';
import FontAwesome, { Icons } from 'react-native-fontawesome';

import Card from '../Card/Card';

export default class Login extends Component {

    render() {

        const { navigation } = this.props;
        //const sections = navigation.getParam('sections', {});

        return (
            <View style={styles.dataInputContainer}>
                <View style={styles.imageContainer}>
                    <Image source={require('./Logo.png')} style={styles.image} />
                    <Text style={styles.companyText}>{'WalletLess'}</Text>
                </View>
                <View style={styles.inputContainer}>
                    <View style={{flex: 1}}>
                        <Card myWidth={350} myHeight={50} borRadius={100} padBot={20} marBot={10} marTop={5}>
                            <FloatingLabelInputIcon
                                icon={Icons.envelope}
                                label='Email'
                                dataName='email'
                                value=""
                                myKeyboardType='email-address'
                                hasSecureTextEntry={false}
                            />
                        </Card>
                        <Card myWidth={350} myHeight={50} borRadius={100} padBot={20} marBot={20} marTop={5}>
                            <FloatingLabelInputIcon
                                icon={Icons.lock}
                                label='Password'
                                dataName='password'
                                value=""
                                newFontSize={30}
                                myKeyboardType='default'
                                hasSecureTextEntry={true}
                            />
                        </Card>
                    </View>
                    <View style={{flex:2}}>
                        <View style={styles.otherOptionsContainer}>
                            <TouchableHighlight onPress={() => console.log('TBD')} underlayColor="transparent">
                                    <Text style={styles.otherOption}>Sign Up!</Text>
                                </TouchableHighlight>
                            <TouchableHighlight onPress={() => console.log('TBD')} underlayColor="transparent">
                                    <Text style={styles.otherOption}>Forgot Password?</Text>
                            </TouchableHighlight>
                        </View>
                        <View style={styles.buttonContainer}>
                            <TouchableHighlight onPress={() => this.props.navigation.navigate('MenuScreen')} underlayColor="transparent">
                                <View style={styles.login}>
                                    <Text style={styles.text}>Login</Text>
                                </View>
                            </TouchableHighlight>
                        </View>
                    </View>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    dataInputContainer: {
        flex: 1
    },
    image: {
        width: 200, 
        height: 200, 
        justifyContent: 'center',
        alignItems: 'center',
    },
    imageContainer: {
        flex: 3,
        justifyContent: 'center',
        alignItems: 'center',
    },
    inputContainer: {
        flex: 4
    },
    companyText: {
        fontSize: 24,
        color: '#999'
    },
    buttonContainer: {
        marginTop: 10,
        justifyContent: 'center',
        alignItems: 'center',
        flex: 5
    },
    login: {
        width: 100,
        height: 100,
        backgroundColor: '#1976D2',
        justifyContent: 'center',
        alignItems: 'center',
        marginBottom: 25,
        borderRadius: 50,
        shadowOpacity: 0.25,
        shadowRadius: 3,
        shadowOffset: {
            height: 3,
            width: 3
        },
    },
    text: {
        color: '#f0f0f0',
        fontSize: 18,
        fontWeight: '100'
    },
    otherOptionsContainer: {
        flexDirection: 'row',
        flex: 1,
        width: 350
    },
    otherOption: {
        flex: 1,
        color: '#1976D2',
        fontSize: 14,
        justifyContent: 'space-between',
        alignItems: 'stretch',
        width: 190,
        height: 50,
        marginLeft: 25
    }
});
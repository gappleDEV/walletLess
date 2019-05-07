import React, { Component } from 'react';
import {
    Platform,
    View,
    Text,
    TextInput,
    TouchableHighlight,
    Image,
    StyleSheet,
    Alert
} from 'react-native';
import LinearGradient from 'react-native-linear-gradient';
//import FloatingLabelInputIcon from './../FloatingLabelInput/FloatingLabelInputIcon';
//import FontAwesome, { Icons } from 'react-native-fontawesome';
//import FontAwesome5 from 'react-native-vector-icons/FontAwesome5';
import MaterialIcon from 'react-native-vector-icons/MaterialIcons';
import MaterialCommunityIcon from 'react-native-vector-icons/MaterialCommunityIcons';

import Bank from '../../schema/Bank';
import CreditCard from '../../schema/CreditCard';
import Employment from '../../schema/Employment';
import GeneralInsurance from '../../schema/GeneralInsurance';
import HealthcareInsurance from '../../schema/HealthcareInsurance';
import HomeownersInsurance from '../../schema/HomeownersInsurance';
import MotorVehicleDocs from '../../schema/MotorVehicleDocs';
import MotorVehicleInsurance from '../../schema/MotorVehicleInsurance';
import Personal from '../../schema/Personal';
import Prescription from '../../schema/Prescription';
import User from '../../schema/User';

// API Request
import { type, CallApi } from '../../api/CallApi';

// Common Styles
import { c } from '../../styles/common';

const font = Platform.select({
    ios: 'System',
    android: 'Roboto',
});

export default class Login extends Component {

    constructor(props) {
        super(props);
        this.state = {
            realm: null,
            email: '',
            password: ''
        };

        Realm.open({
            schema: [Bank, CreditCard, Employment, GeneralInsurance, HealthcareInsurance, HomeownersInsurance,
                MotorVehicleDocs, MotorVehicleInsurance, Personal, Prescription, User],
            schemaVersion: 2,
            encryptionKey: this.props.screenProps.key,
        }).then(realm => {
            this.setState({ realm });
        })

    }

    checkLoginAndOpenRealm = () => {

        let requestType = type.GET;
        let url = '/user/create?';
        let params = 'email=' + this.state.email + '&upw=' + this.state.password;

        const apiCall = new CallApi(requestType, url, params);

        let realm = this.state.realm;
        let allInfo = realm.objects('User');
        if (allInfo.length == 0) {
            Alert.alert("This device does not have a user attached. Walletless is not currently supporting logging in with a user created at another point in time. Register a new user for testing.");
        } else {
            let myUser = allInfo[0]; //at most 1 user saved locally
            if (myUser.email.toUpperCase() == this.state.email.toUpperCase() && myUser.password == this.state.password) {
                apiCall.request().then((response) => {
                    //Alert.alert(JSON.stringify(response));
                    this.props.screenProps.setRealm(this.state.realm);
                    this.props.navigation.navigate('HomeScreen', {
                        realm: this.state.realm
                    });
                }, (error) => {
                    Alert.alert("Error communicating with backend: " + JSON.stringify(error));
                    this.props.screenProps.setRealm(this.state.realm);
                    this.props.navigation.navigate('HomeScreen', {
                        realm: this.state.realm
                    });
                });
            } else {
                Alert.alert("Email or password is incorrect.");
            }
        }
    }

    openRegisterView = () => {
        this.props.screenProps.setRealm(this.state.realm);
        this.props.navigation.navigate('RegisterScreen', {
            realm: this.state.realm
        });
    }

    render() {

        const { navigation } = this.props;
        //const sections = navigation.getParam('sections', {});

        /* const info = this.state.realm
      ? 'Name: ' + this.state.realm.objects('Personal')[0].firstName
      : 'Loading...'; */

        return (
            <View style={styles.dataInputContainer}>
                <View style={styles.imageContainer}>
                    <Image source={require('./../../images/Logo.png')} style={styles.image} />
                    <Text style={styles.companyText}>{'WalletLess'}</Text>
                    {/* <Text style={{borderColor: 'black', borderWidth: 2}}>{info}</Text> */}
                </View>
                <View style={styles.inputContainer}>
                    <View style={styles.emailInput}>
                        <MaterialCommunityIcon name={'email-outline'} style={styles.email} />
                        <TextInput
                            style={styles.textInput}
                            onChangeText={(text) => this.setState({ ...this.state, email: text })}
                            value={this.state.email}
                            placeholder='Email'
                            placeholderTextColor={'#707A88'}
                            keyboardType='email-address'
                            keyboardAppearance='dark'>
                        </TextInput>
                    </View>
                    <View style={styles.passInput}>
                        <MaterialIcon name={'lock-outline'} style={styles.email} />
                        <TextInput
                            style={styles.textInput}
                            onChangeText={(text) => this.setState({ ...this.state, password: text })}
                            value={this.state.password}
                            placeholder='Password'
                            placeholderTextColor={'#707A88'}
                            secureTextEntry={true}
                            keyboardAppearance='dark'>
                        </TextInput>
                    </View>
                    <TouchableHighlight onPress={() => console.log('Forgot password Pressed')} underlayColor="transparent">
                        <Text style={styles.forgotText}>Forgot password?</Text>
                    </TouchableHighlight>
                    <TouchableHighlight
                        onPress={() => this.checkLoginAndOpenRealm()} underlayColor="transparent">
                        <LinearGradient
                            start={{ x: 0, y: 0 }} end={{ x: 1, y: 0 }}
                            colors={[c.blue.backgroundColor, c.blue.borderColor]}
                            style={styles.loginButton}>
                            <Text style={styles.loginText}>Log In</Text>
                        </LinearGradient>
                    </TouchableHighlight>
                    <TouchableHighlight onPress={() => this.openRegisterView()} underlayColor="transparent">
                        <Text style={styles.signUpText}>Sign Up</Text>
                    </TouchableHighlight>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    dataInputContainer: {
        flex: 1,
        backgroundColor: c.grayBodyBg.backgroundColor,
    },
    imageContainer: {
        flex: 3,
        justifyContent: 'center',
        alignItems: 'center',
    },
    image: {
        width: 250,
        height: 200,
        justifyContent: 'center',
        alignItems: 'center',
    },
    companyText: {
        fontSize: 24,
        color: c.gray3.color,
        fontFamily: font,
        fontWeight: '200'
    },
    inputContainer: {
        flex: 3,
        alignItems: 'center',
    },
    emailInput: {
        width: 300,
        height: 40,
        borderBottomWidth: 1,
        borderBottomColor: c.gray3.color,
        flexDirection: 'row'
    },
    passInput: {
        width: 300,
        height: 40,
        borderBottomWidth: 1,
        borderBottomColor: c.gray3.color,
        flexDirection: 'row',
        marginTop: 25
    },
    email: {
        color: c.gray3.color,
        fontSize: 24,
        marginTop: 12,
        alignSelf: 'flex-start'
    },
    textInput: {
        color: c.gray3.color,
        fontSize: 18,
        marginTop: 14,
        fontFamily: font,
        fontWeight: '200',
        alignSelf: 'flex-start',
        marginLeft: 20,
        width: 250
    },
    loginButton: {
        padding: 10,
        width: 300,
        height: 48,
        alignItems: 'center',
        borderRadius: 5,
        marginTop: 100
    },
    loginText: {
        color: c.gray1.color,
        fontFamily: font,
        fontWeight: '300',
        fontSize: 24
    },
    forgotText: {
        color: c.gray3.color,
        fontSize: 12,
        marginTop: 5,
        fontFamily: font,
        fontWeight: '200',
        width: 300,
        justifyContent: 'flex-start'
    },
    signUpText: {
        color: c.gray3.color,
        fontSize: 18,
        marginTop: 10,
        width: 300,
        padding: 10,
        textAlign: 'center',
        fontFamily: font,
        fontWeight: '200',
        borderColor: c.gray3.color,
        borderWidth: 1,
        borderRadius: 5
    }
});
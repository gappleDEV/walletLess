import React, { Component } from 'react';
import {
    Platform,
    View,
    Text,
    TextInput,
    TouchableHighlight,
    Image,
    StyleSheet,
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

const font = Platform.select({
    ios: 'System',
    android: 'Roboto',
});

const colors = {
    bg: '#2f3c51',
    text: '#afb6c0',
    logIn: '#e4ebed',
    gradStart: '#17b7c8',
    gradEnd: '#3abcb4'
}

export default class Login extends Component {

    constructor(props) {
        super(props);
        this.state = {
            realm: null,
            email: '',
            password: ''
        };
    }

    /* componentWillMount() {
        Realm.open({
            schema: [Personal], encryptionKey: this.props.screenProps.key
        }).then(realm => {
            this.setState({ realm });
        });
    } */

    checkLoginAndOpenRealm = () => {
        //TBD: Check if the email and password match an account

        Realm.open({
            schema: [Bank, CreditCard, Employment, GeneralInsurance, HealthcareInsurance, HomeownersInsurance,
                MotorVehicleDocs, MotorVehicleInsurance, Personal, Prescription, User], encryptionKey: this.props.screenProps.key
        }).then(realm => {
            let allInfo = realm.objects('User');
            if(allInfo.length == 0) {
                realm.write(() => {
                    realm.create('User', { id: 1, email: 'walletless@gmail.com', password: 'password' }, true);
                })
            } else {
                let myUser = allInfo[0]; //at most 1 user saved locally
                if(myUser.email.toUpperCase() == this.state.email.toUpperCase() && myUser.password == this.state.password) {
                    realm.write(() => {
                        realm.create('Personal', { id: 1, firstName: 'Gregory' }, true);
                    });
                    this.setState({realm});
                    this.props.navigation.navigate('MenuScreen', {
                        realm: this.state.realm
                    });
                }
            }        
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
                    <Image source={require('./Logo.png')} style={styles.image} />
                    <Text style={styles.companyText}>{'WalletLess'}</Text>
                    {/* <Text style={{borderColor: 'black', borderWidth: 2}}>{info}</Text> */}
                </View>
                <View style={styles.inputContainer}>
                    <View style={styles.emailInput}>
                        <MaterialCommunityIcon name={'email-outline'} style={styles.email} />
                        <TextInput
                            style={styles.textInput}
                            onChangeText={(text) => this.setState({ ...this.state, email: text })}
                            value={this.state.text}
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
                            value={this.state.text}
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
                        onPress={() => this.checkLoginAndOpenRealm()} underlayColor={colors.bg}>
                        <LinearGradient
                            start={{ x: 0, y: 0 }} end={{ x: 1, y: 0 }}
                            colors={[colors.gradStart, colors.gradEnd]}
                            style={styles.loginButton}>
                            <Text style={styles.loginText}>Log In</Text>
                        </LinearGradient>
                    </TouchableHighlight>
                    <TouchableHighlight onPress={() => console.log('Sign Up Pressed')} underlayColor="transparent">
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
        backgroundColor: colors.bg
    },
    imageContainer: {
        flex: 3,
        justifyContent: 'center',
        alignItems: 'center',
    },
    image: {
        width: 200,
        height: 200,
        justifyContent: 'center',
        alignItems: 'center',
    },
    companyText: {
        fontSize: 24,
        color: colors.text,
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
        borderBottomColor: colors.text,
        flexDirection: 'row'
    },
    passInput: {
        width: 300,
        height: 40,
        borderBottomWidth: 1,
        borderBottomColor: colors.text,
        flexDirection: 'row',
        marginTop: 25
    },
    email: {
        color: colors.text,
        fontSize: 24,
        marginTop: 12,
        alignSelf: 'flex-start'
    },
    textInput: {
        color: colors.text,
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
        color: colors.logIn,
        fontFamily: font,
        fontWeight: '300',
        fontSize: 24
    },
    forgotText: {
        color: colors.text,
        fontSize: 12,
        marginTop: 5,
        fontFamily: font,
        fontWeight: '200',
        width: 300,
        justifyContent: 'flex-start'
    },
    signUpText: {
        color: colors.text,
        fontSize: 18,
        marginTop: 10,
        width: 300,
        padding: 10,
        textAlign: 'center',
        fontFamily: font,
        fontWeight: '200',
        borderColor: colors.text,
        borderWidth: 1,
        borderRadius: 5
    }
});
import React, { Component } from 'react';
import {
    Platform,
    View,
    Text,
    TextInput,
    TouchableHighlight,
    StyleSheet,
    Alert
} from 'react-native';
import LinearGradient from 'react-native-linear-gradient';
import MaterialCommunityIcon from 'react-native-vector-icons/MaterialCommunityIcons';

// API Request
import { type, CallApi } from '../../api/CallApi';

// Common Styles
import { c } from '../../styles/common';

const font = Platform.select({
    ios: 'System',
    android: 'Roboto',
});

export default class Register extends Component {

    constructor(props) {
        super(props);
        const { navigation } = this.props;
        this.state = {
            realm: navigation.getParam('realm', {}),
            email: '',
            password: '',
            confirmPass: '',
            firstName: '',
            lastName: ''
        };

    }

    removeAllOtherData() {
        let realm = this.state.realm;

        let bank = realm.objects('Bank');
        let creditCard = realm.objects('CreditCard');
        let employment = realm.objects('Employment');
        let generalIns = realm.objects('GeneralInsurance');
        let healthIns = realm.objects('HealthcareInsurance');
        let homeIns = realm.objects('HomeownersInsurance');
        let motorDocs = realm.objects('MotorVehicleDocs');
        let motorVIns = realm.objects('MotorVehicleInsurance');
        let personalInfo = realm.objects('Personal');
        let prescr = realm.objects('Prescription');
        let userInfo = realm.objects('User');

        let allInfo = [bank, creditCard, employment, generalIns, healthIns, homeIns, motorDocs, motorVIns, personalInfo, prescr, userInfo];

        if(userInfo.length !== 0) {
            realm.write(() => {
                allInfo.forEach((obj) => {
                    realm.delete(obj);
                })
            });
            this.setState({ realm });
        }
    }

    checkConfirmPassword() {
        if(this.state.password === this.state.confirmPass) {
            let realm = this.state.realm;
            let requestType = type.GET;
            let url = '/user/create?';
            let params = 'email=' + this.state.email + '&upw=' + this.state.password;
            const apiCall = new CallApi(requestType, url, params);
            apiCall.request().then((response) => {
                this.removeAllOtherData();
                realm.write(() => {
                    realm.create('Personal', {id: response.userId, firstName: this.state.firstName, lastName: this.state.lastName}, true);
                    realm.create('User', {id: response.userId, email: this.state.email, password: this.state.password}, true);
                });
                this.setState({ realm });
                this.openLoginView();
            }, (error) => {
                this.removeAllOtherData();
                realm.write(() => {
                    realm.create('Personal', {id: response.userId, firstName: this.state.firstName, lastName: this.state.lastName}, true);
                    realm.create('User', {id: response.userId, email: this.state.email, password: this.state.password}, true);
                });
                this.setState({ realm });
                this.openLoginView();
            });
        } else {
            Alert.alert("Passwords do not match.");
        }
    }

    openLoginView() {
        this.props.navigation.navigate('LoginScreen', {
            realm: this.state.realm
        });
    }

    render() {

        const { navigation } = this.props;
        //const sections = navigation.getParam('sections', {});

        return (
            <View style={styles.dataInputContainer}>
                <View style={styles.titleContainer}>
                    <Text style={styles.title}>Create</Text>
                    <Text style={styles.title}>Account</Text>
                </View>
                <View style={styles.inputContainer}>
                    <View style={styles.emailInput}>
                        <MaterialCommunityIcon name={'account-box-outline'} style={styles.email} />
                        <TextInput
                            style={styles.textInput}
                            onChangeText={(text) => this.setState({ ...this.state, firstName: text })}
                            value={this.state.firstName}
                            placeholder='First Name'
                            placeholderTextColor={'#707A88'}
                            keyboardAppearance='dark'>
                        </TextInput>
                    </View>

                    <View style={styles.emailInput}>
                        <MaterialCommunityIcon name={'account-box-outline'} style={styles.email} />
                        <TextInput
                            style={styles.textInput}
                            onChangeText={(text) => this.setState({ ...this.state, lastName: text })}
                            value={this.state.lastName}
                            placeholder='Last Name'
                            placeholderTextColor={'#707A88'}
                            keyboardAppearance='dark'>
                        </TextInput>
                    </View>
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
                    <View style={styles.emailInput}>
                        <MaterialCommunityIcon name={'lock-outline'} style={styles.email} />
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
                    <View style={styles.emailInput}>
                        <MaterialCommunityIcon name={'lock-outline'} style={styles.email} />
                        <TextInput
                            style={styles.textInput}
                            onChangeText={(text) => this.setState({ ...this.state, confirmPass: text })}
                            value={this.state.confirmPass}
                            placeholder='Confirm Password'
                            placeholderTextColor={'#707A88'}
                            secureTextEntry={true}
                            keyboardAppearance='dark'>
                        </TextInput>
                    </View>
                    <TouchableHighlight
                        onPress={() => this.checkConfirmPassword()} underlayColor="transparent">
                        <LinearGradient
                            start={{ x: 0, y: 0 }} end={{ x: 1, y: 0 }}
                            colors={[c.green.backgroundColor, c.green.borderColor]}
                            style={styles.registerButton}>
                            <Text style={styles.registerText}>Register</Text>
                        </LinearGradient>
                    </TouchableHighlight>
                    <TouchableHighlight onPress={() => this.openLoginView()} underlayColor="transparent">
                        <Text style={styles.signInText}>Sign In</Text>
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
    titleContainer: {
        flex: 1,
        paddingLeft: 20,
        paddingTop: 10,
        paddingBottom: 10,
        marginTop: 25,
        marginBottom: 25,
        alignItems: 'center',
        backgroundColor: c.gray4.backgroundColor
    },
    title: {
        fontSize: 32,
        width: 300,
        color: c.gray1.color,
    },
    inputContainer: {
        flex: 8,
        alignItems: 'center',
    },
    emailInput: {
        marginTop: 15,
        width: 300,
        height: 40,
        borderBottomWidth: 1,
        borderBottomColor: c.gray3.color,
        flexDirection: 'row'
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
    registerButton: {
        padding: 10,
        width: 300,
        height: 48,
        alignItems: 'center',
        borderRadius: 5,
        marginTop: 100
    },
    registerText: {
        color: c.gray1.color,
        fontFamily: font,
        fontWeight: '300',
        fontSize: 24
    },
    signInText: {
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
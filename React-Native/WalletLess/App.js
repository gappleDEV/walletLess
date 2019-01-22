/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  View,
  Text,
  Dimensions
} from 'react-native';
import { createStackNavigator, createBottomTabNavigator} from 'react-navigation';
import * as Keychain from 'react-native-keychain';

//Icons on tab nav
import FontAwesome, { Icons } from 'react-native-fontawesome';
import MaterialIcon from 'react-native-vector-icons/MaterialIcons';
import MaterialCommunityIcon from 'react-native-vector-icons/MaterialCommunityIcons';

//For IPhone X
import SafeAreaView from 'react-native-safe-area-view';

//Realm
const Realm = require('realm');

import Personal from './src/schema/Personal';

// 512 bit encryption
var CryptoJs = require('crypto-js'); //CryptoJs.SHA256("");

//Custom components and styles
import Menu from './src/components/Menu/Menu';
import DataInput from './src/components/DataInput/DataInput';
import TakePicture from './src/components/Picture/TakePicture';
import Login from './src/components/Login/Login';
import Register from './src/components/Login/Register';
import Messages from './src/components/Messages/Messages';
import Reports from './src/components/Reports/Reports';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

let d = Dimensions.get('window');
const { height, width } = d;
const isIphoneX = Platform.OS === 'ios' && (height === 812 || width === 812);

const ScreenStack = createStackNavigator({
  LoginScreen: {
    screen: Login,
    navigationOptions: ({ navigation }) => ({
      header: null,
    }),
  },
  RegisterScreen: {
    screen: Register,
    navigationOptions: ({ navigation }) => ({
      header: null,
    }),
  },
  DataInputScreen: {
    screen: DataInput,
    navigationOptions: ({ navigation }) => ({
      header: null,
    }),
  },
  HomeScreen: {
    screen: createBottomTabNavigator({
      MessagesScreen: {
        screen: Messages,
        navigationOptions: ({ navigation }) => ({
          title: 'Messages',
           tabBarIcon: ({ focused, horizontal, tintColor }) => {
            return <MaterialCommunityIcon name={'mailbox'} style={{color: tintColor, fontSize: 20}} />;
          },
        }),
      },
      MenuScreen: {
        screen: Menu,
        navigationOptions: ({ navigation }) => ({
          title: 'Home',
           tabBarIcon: ({ focused, horizontal, tintColor }) => {
            return <FontAwesome style={{color: tintColor, fontSize: 20}}>{Icons.listUl}</FontAwesome>;
          },
        }),
      },
      ReportsScreen: {
        screen: Reports,
        navigationOptions: ({ navigation }) => ({
          title: 'Reports',
           tabBarIcon: ({ focused, horizontal, tintColor }) => {
            return <MaterialCommunityIcon name={'view-grid'} style={{color: tintColor, fontSize: 20}} />;
          },
        }),
      },
    }, {
      initialRouteName: 'MenuScreen',
      tabBarOptions : {
        activeTintColor: '#17B7C8',
        inactiveTintColor: '#AFB6C0',
         style: {
          paddingTop: 10,
          backgroundColor: '#2F3C51',
          paddingBottom: 0
        },
        labelStyle: { 
          fontSize: 14
        }
      }
    }),
    navigationOptions: ({ navigation }) => ({
      title: 'Home',
    }),
  },
},
{
  initialRouteName: 'LoginScreen',
  headerMode: 'none',
  cardStyle: { shadowColor: 'transparent' },
  navigationOptions: {
    headerVisible: false
  }
});

const username = 'gsoccer'; //TBD to user's username when account creation is implemented

export default class App extends Component {

  constructor(props) {
    super(props);
    this.state = { 
      realm: null,
      key: '',
      setRealm: this.setStateRealm 
    };
  }

  wordNum = ''
  key = '';

  //Open the realm
  componentWillMount() {
    console.log("Will mount");
    var credentials = Keychain.getGenericPassword();
    var tries = 0;
    while(!credentials && tries < 5) {
      tries++;
      console.log("Attempting to set up keychain. Attempt number " + tries);
      Keychain.setGenericPassword('WalletLess', username);
      credentials = Keychain.getGenericPassword();
    }
    if(tries < 5) {
      this.wordNum = CryptoJs.SHA512(credentials.password).words;
      var keyTemp = new Int8Array(64);
      this.wordNum.forEach(function(n, i) {
        var temp = "";
        if(n >= 0) {
          temp = n.toString(2);
        } else {
          temp = (~n).toString(2);
        }

        //All need to be exactly 32 bits long
        if(temp.length > 32) {
          temp = temp.substring(0, 32);
        }
        while(temp.length < 32) {
          temp = '0' + temp;
        }

        //For every 8 bits create next number in the key
        for(var j = i * 4; j < i * 4 + 4; j++) {
          keyTemp[j] = parseInt(temp.substring(0,8), 2);
          temp = temp.substring(8);
        }
        
      });
      console.log(keyTemp);
      this.key = keyTemp;
      this.state.key = keyTemp;
    } else {
      console.log("All tries to get realm key used. Realm cannot be opened at this time");
    }

  }

  setStateRealm = (openedRealm) => {
    this.setState(prevState => ({
      ...prevState,
      realm: openedRealm
    }));
  }

  render() {
    return (
      //<View style={{flex: 1}}>
      //<SafeAreaView style={{flex: 1, backgroundColor: 'grey'}}>
      <View style={[{flex: 1, backgroundColor: '#2F3C51'}, , isIphoneX && {paddingTop: 44}]}>
        <ScreenStack screenProps={this.state}/>
      </View>
        //<TabNavigator />
      //</SafeAreaView>
      //</View>
    );
  }
}

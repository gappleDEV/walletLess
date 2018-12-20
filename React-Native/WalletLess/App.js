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
  Text
} from 'react-native';
import { createStackNavigator, createBottomTabNavigator } from 'react-navigation';
import * as Keychain from 'react-native-keychain';

//Icons on tab nav
import FontAwesome, { Icons } from 'react-native-fontawesome';

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

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

const RootStack = createStackNavigator(
  {
    MenuScreen: { screen: Menu },
    DataInputScreen: { screen: DataInput },
    LoginScreen: {screen: Login}
  },
  {
    initialRouteName: 'LoginScreen',
    headerMode: 'none',
    cardStyle: { shadowColor: 'transparent' },
    navigationOptions: {
      headerVisible: false
    }
  }
);

class SettingsScreen extends React.Component {
  render() {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text>Settings!</Text>
      </View>
    );
  }
}

const TabNavigator = createBottomTabNavigator({
  Home: { screen: RootStack, navigationOptions: ({ navigation }) => ({
    title: "Menu",
    tabBarIcon: ({ focused, horizontal, tintColor }) => {
      return <FontAwesome style={{color: tintColor, fontSize: 20}}>{Icons.listUl}</FontAwesome>;
    },
  })},
  Picture: { screen: TakePicture,
  navigationOptions: ({ navigation }) => ({
    title: "Take Picture",
    tabBarIcon: ({ focused, horizontal, tintColor }) => {
      return <FontAwesome style={{color: tintColor, fontSize: 20}}>{Icons.camera}</FontAwesome>;
    },
  })
  }
},
{
    tabBarOptions : {
      activeTintColor: '#1262B2',
      inactiveTintColor: '#888888',
      style: {
        paddingTop: 10,
        backgroundColor: '#c0c0c0',
      },
      labelStyle: { 
        fontSize: 14
      }
    }
});

const username = 'gsoccer'; //TBD to user's username when account creation is implemented

export default class App extends Component {

  constructor(props) {
    super(props);
    this.state = { 
      realm: null,
      key: '' 
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

  render() {
    return (
      //<View style={{flex: 1}}>
      <SafeAreaView style={{flex: 1, backgroundColor: '#2f3c51'}}>
        <RootStack screenProps={this.state}/>
        {/*<TabNavigator />*/}
      </SafeAreaView>
      //</View>
    );
  }
}

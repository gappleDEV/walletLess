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
import TakePicture from './src/components/Picture/TakePicture';

//For IPhone X
import SafeAreaView from 'react-native-safe-area-view';

//Realm
const Realm = require('realm');

import Personal from './src/schema/Personal';

// 512 bit encryption
var CryptoJs = require('crypto-js'); //CryptoJs.SHA256("");

//Custom components and styles
import Menu from './src/components/Menu/Menu';
import FloatingLabelInput from './src/components/FloatingLabelInput/FloatingLabelInput';
import DataInput from './src/components/DataInput/DataInput';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

const RootStack = createStackNavigator(
  {
    MenuScreen: Menu,
    DataInputScreen: DataInput
  },
  {
    initialRouteName: 'MenuScreen',
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
  Home: { screen: RootStack },
  Picture: { screen: TakePicture },
});

const username = 'gsoccer'; //TBD to user's username when account creation is implemented

export default class App extends Component {

  state = {
    value: '',
    realm: null
  };

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
    } else {
      console.log("All tries to get realm key used. Realm cannot be opened at this time");
    }

    Realm.open({
      schema: [Personal], encryptionKey: this.key
    }).then(realm => {
      realm.write(() => {
        let allInfo = realm.objects('Personal');
        //realm.delete(allInfo); // to delete all in the table
        if(allInfo.length == 0) {
          const personInfo = realm.create('Personal', {id: 1});
        }
        console.log(Array.from(realm.objects('Personal')));
      });
      this.setState({realm});
    });
  }

  //handleTextChange = (newText) => this.setState({ value: newText });

  render() {
    return (
      //<View style={{flex: 1}}>
      <SafeAreaView style={{flex: 1, backgroundColor: '#c0c0c0'}}>
        {/*<RootStack />*/}
        <TabNavigator />
      </SafeAreaView>
      //</View>
    );
  }
}

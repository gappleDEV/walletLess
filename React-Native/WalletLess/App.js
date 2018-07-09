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
import { createStackNavigator } from 'react-navigation';
import * as Keychain from 'react-native-keychain';

//Realm
const Realm = require('realm');

import PersonalInformation from './src/schema/PersonalInformation';

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
    navigationOptions: {
      headerVisible: false
    }
  }
);

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
      schema: [PersonalInformation], encryptionKey: this.key
    }).then(realm => {
      realm.write(() => {
        let allInfo = realm.objects('PersonalInformation');
        //realm.delete(allInfo); // to delete all in the table
        if(allInfo.length == 0) {
          const personInfo = realm.create('PersonalInformation', {id: 1});
        }
        console.log(Array.from(realm.objects('PersonalInformation')));
      });
      this.setState({realm});
    });
  }

  handleTextChange = (newText) => this.setState({ value: newText });

  render() {
    return (
      <View style={{flex: 1}}>
        <RootStack />
        {/*<Menu />*/}
        {/*<MenuHeader name={"Gregory"}></MenuHeader>
        <FloatingLabelInputIcon
          icon={Icons.envelope}
          label="Email"
          value={this.state.value}
          onChangeText={this.handleTextChange}
        />
        <FloatingLabelInput
          label="Email"
          value={this.state.value}
          onChangeText={this.handleTextChange}
        /> 
        <CompartmentCard compartmentName={"Personal and Employment"} leftColor={"#0000FF"}
        subComps={[{
          key: 0,
          name: "- Patient"
        },{
          key: 1,
          name: "- Next of Kin"
        }]}>
        </CompartmentCard>*/}
      </View>
    );
  }
}

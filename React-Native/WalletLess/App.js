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
import FontAwesome, { Icons } from 'react-native-fontawesome';

//Custom components and styles
import FloatingLabelInput from './src/components/FloatingLabelInput';
import FloatingLabelInputIcon from './src/components/FloatingLabelInputIcon';
import commonStyles from './src/styles/common';
import Card from './src/components/Card';
import CompartmentCard from './src/components/CompartmentCard';
import MenuHeader from './src/components/MenuHeader';
import Menu from './src/components/Menu';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});



export default class App extends Component {

  state = {
    value: '',
  };

  handleTextChange = (newText) => this.setState({ value: newText });

  comp = [{
    key: 0,
    compartmentName: "Personal and Employment",
    leftColor: '#0000FF',
    subComps:[{
      key: 0,
      name: "- Patient"
    },
    {
      key: 1,
      name: "- Next of Kin"
    }  
  ]},
  {
    key: 1,
    compartmentName: "Medical Insurance",
    leftColor: '#00FF00',
    subComps:[{
      key: 0,
      name: "- Policy"
    },
    {
      key: 1,
      name: "- Guarantor"
    }  
  ]}
  ];

  render() {
    return (
      <View>
        <Menu myCompartments={this.comp}/>
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

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  }
});

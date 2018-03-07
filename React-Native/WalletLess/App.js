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

  render() {
    return (
      <View>
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
        <Card>
          <Text>This is a card?</Text>
        </Card>
        <Card>
          <FloatingLabelInput
            label="Input"
            value={this.state.value}
            onChangeText={this.handleTextChange}
          />
        </Card>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

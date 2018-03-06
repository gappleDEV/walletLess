/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import FontAwesome, { Icons } from 'react-native-fontawesome';
import FloatingLabelInput from './src/components/FloatingLabelInput';
import FloatingLabelInputIcon from './src/components/FloatingLabelInputIcon';

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

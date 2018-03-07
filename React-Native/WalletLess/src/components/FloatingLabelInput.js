import React, { Component } from 'react';
import {
  View,
  StatusBar,
  TextInput,
  Text,
  Animated,
  StyleSheet
} from 'react-native';

const labelData = {
  topPadding: 18,
  startFontSize: 20,
};

export default class FloatingLabelInput extends Component {
  state = {
    isFocused: false,
  };

  componentWillMount() {
    this._animatedIsFocused = new Animated.Value(this.props.value === '' ? 0 : 1);
  }

  componentDidUpdate() {
    Animated.timing(this._animatedIsFocused, {
      toValue: (this.state.isFocused || this.props.value !== '') ? 1 : 0,
      duration: 200,
    }).start();
  }

  onFocus = () => {
    this.setState({
      isFocused: true,
    })
  }

  onBlur = () => {
    this.setState({
      isFocused: false,
    })
  }

  render() {
    const { label, ...props } = this.props;
    const labelStyle = {
      position: 'absolute',
      left: 0,
      top: this._animatedIsFocused.interpolate({
        inputRange: [0, 1],
        outputRange: [labelData.topPadding, 0],
      }),
      fontSize: this._animatedIsFocused.interpolate({
        inputRange: [0, 1],
        outputRange: [labelData.startFontSize, 14],
      }),
      color: this._animatedIsFocused.interpolate({
        inputRange: [0, 1],
        outputRange: ['#aaa', '#000'],
      }),
    };
    
    return (
      <View style={styles.container}>
        <Animated.Text style={labelStyle}>
          {label}
        </Animated.Text>
        <TextInput
          {...props}
          style={[styles.textInput, this.state.isFocused && styles.borderHighlight]}
          onFocus={this.onFocus}
          onBlur={this.onBlur}
          blurOnSubmit
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    paddingTop: labelData.topPadding,
  },
  textInput: {
    alignSelf: 'stretch',
    height: 26, 
    fontSize: labelData.startFontSize, 
    color: '#000',
    borderBottomWidth: 3, 
    borderBottomColor: '#000',
  },
  borderHighlight: {
    borderBottomColor: '#0F0',
  }
});
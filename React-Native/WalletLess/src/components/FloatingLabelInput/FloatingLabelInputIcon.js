import React, { Component } from 'react';
import {
  View,
  StatusBar,
  TextInput,
  Text,
  Animated,
  StyleSheet
} from 'react-native';
//import FontAwesome, { Icons } from 'react-native-fontawesome';
import FontAwesome5, { Icons } from 'react-native-vector-icons/FontAwesome5';

let labelData = {
  topPadding: 10,
  startFontSize: 20,
  paddingFromIcon: 20,
};

export default class FloatingLabelInputIcon extends Component {
  state = {
    isFocused: false,
    text: this.props.value
  };

  componentWillMount() {
    this._animatedIsFocused = new Animated.Value(this.state.text === '' ? 0 : 1);
  }

  componentDidUpdate() {
    Animated.timing(this._animatedIsFocused, {
      toValue: (this.state.isFocused || this.state.text !== '') ? 1 : 0,
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
      left: labelData.paddingFromIcon + labelData.startFontSize,
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
        outputRange: ['#aaa', 'rgba(0, 0, 0, 0.0)'],
      }),
    };

    changeText = (inputText) => {
      this.setState(prevState => ({...prevState, text: inputText}));
    }
    
    return (
      <View style={styles.container}>
        <FontAwesome5 style={[styles.icon, {fontSize: this.props.newFontSize ? this.props.newFontSize : labelData.startFontSize,}]}>{
          this.props.icon}
        </FontAwesome5>
        <Animated.Text style={labelStyle}>
          {label}
        </Animated.Text>
        <TextInput
          style={[styles.textInput, this.state.isFocused && styles.textInputNormal]}
          onFocus={this.onFocus}
          onBlur={this.onBlur}
          onChangeText={(inputText) => changeText(inputText)}
          keyboardType={this.props.myKeyboardType}
          secureTextEntry={this.props.hasSecureTextEntry}
          blurOnSubmit
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    paddingLeft: 10,
    paddingTop: labelData.topPadding,
    flexDirection: 'row',
  },
  icon: {
    width: 30,
    paddingRight: labelData.paddingFromIcon,
    color: '#1976D2'
  },
  textInput: {
    width: 250,
    height: 26, 
    fontSize: labelData.startFontSize, 
    color: '#389CFF'
  },
  textInputNormal: {
    color: "#1976D2"
  }
});
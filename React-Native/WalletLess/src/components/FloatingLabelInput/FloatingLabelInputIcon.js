import React, { Component } from 'react';
import {
  View,
  StatusBar,
  TextInput,
  Text,
  Animated,
  StyleSheet
} from 'react-native';
import FontAwesome, { Icons } from 'react-native-fontawesome';

const labelData = {
  topPadding: 18,
  startFontSize: 20,
  paddingFromIcon: 10,
};

export default class FloatingLabelInputIcon extends Component {
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
        outputRange: ['#aaa', '#000'],
      }),
    };
    
    return (
      <View style={styles.container}>
        <FontAwesome style={styles.icon}>{
          this.props.icon}
        </FontAwesome>
        <Animated.Text style={labelStyle}>
          {label}
        </Animated.Text>
        <TextInput
          {...props}
          style={styles.textInput}
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
    flexDirection: 'row',
  },
  icon: {
    fontSize: labelData.startFontSize,
    paddingRight: labelData.paddingFromIcon,
  },
  textInput: {
    width: 200,
    height: 26, 
    fontSize: labelData.startFontSize, 
    color: '#000',
  },
});
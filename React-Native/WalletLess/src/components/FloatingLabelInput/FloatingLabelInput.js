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

  constructor(props) {
    super(props);
    this.state = {
      isFocused: false,
      text: this.props.value
    };
  }

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
    this.props.valueChange(this.props.schemaName, this.props.dataName, this.state.text);
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

    changeText = (inputText) => {
      this.setState(prevState => ({...prevState, text: inputText}));
    }
    
    return (
      <View style={styles.container}>
        <Animated.Text style={labelStyle}>
          {label}
        </Animated.Text>
        <TextInput
          style={[styles.textInput, this.state.isFocused && styles.borderHighlight]}
          onFocus={this.onFocus}
          onBlur={this.onBlur}
          onChangeText={(inputText) => changeText(inputText)}
          value={this.state.text}
          blurOnSubmit
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    paddingTop: labelData.topPadding,
    marginTop: 5
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
    borderBottomColor: '#3399FF',
  }
});
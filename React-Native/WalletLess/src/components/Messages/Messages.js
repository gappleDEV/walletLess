import React, { Component } from 'react';
import {
    View,
    Text,
} from 'react-native';

// Common Styles
import { c } from '../../styles/common';

export default class Messages extends Component {

    render() {
        return (
          <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
            <Text>Messaging will be available soon!</Text>
          </View>
        );
      }
}
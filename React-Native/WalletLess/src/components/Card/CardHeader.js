import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet
} from 'react-native';

// Common Styles
import { c } from '../../styles/common';

export default class CardHeader extends Component {

    constructor(props) {
        super(props);
      }

    render() {
        return(
            <View style={styles.cardHeader}>
                <Text style={styles.title}>{this.props.title}</Text>
                <View style={styles.children}>{this.props.children}</View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    cardHeader: {
        backgroundColor: c.gray1.color,
        width: 350,
        height: 30,
        justifyContent: 'center',
        alignItems: 'center',
        borderBottomColor: c.gray2.color,
        borderBottomWidth: 1,
        paddingLeft: 10,
        flexDirection: 'row'
    },
    title: {
        flex: 8,
        color: c.gray4.color,
        fontSize: 16,
        fontWeight: '400'
    },
    children: {
        flex: 1
    }
});
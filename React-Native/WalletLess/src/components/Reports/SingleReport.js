import React, { Component } from 'react';
import {
    View,
    Text,
    StyleSheet,
    Image,
    FlatList,
    TouchableHighlight
} from 'react-native';

export default class SingleReport extends Component {

    constructor() {
        super();
        this.state = {
            count: 0
        };
    }

    onPress = () => {
        this.props.onPressItem(this.props.id);
        this.setState({
            count: this.state.count + 1
        })
    }

    render() {

        const bgColor = this.props.selected ? 'yellow' : 'grey';

        return (
            <TouchableHighlight style={{ backgroundColor: bgColor }} onPress={this.onPress}>
                    <Text style={[styles.imageThumbnail]}>{this.props.id + ' ' + this.state.count}</Text>
            </TouchableHighlight>
        );
    }
}

const styles = StyleSheet.create({
    imageThumbnail: {
        justifyContent: 'center',
        alignItems: 'center',
        textAlign: 'center',
        height: 100,
    },
});
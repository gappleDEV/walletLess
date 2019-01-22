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
        };
    }

    onPress = () => {
        this.props.onPressItem(this.props.id, this.props.index);

    }

    render() {

        const bgColor = this.props.selected ? '#4F6581' : '#5F6368';

        return (
            <TouchableHighlight 
            style={{ backgroundColor: bgColor }} 
            onPress={this.onPress}
            underlayColor='#4E5051'>
                <View style={styles.imageThumbnail}>
                    <Text style={styles.title}>{this.props.id}</Text>
                </View>
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
    title: {
        color: '#D4DCE8',
        fontSize: 22,
        fontWeight: '300'
    }
});
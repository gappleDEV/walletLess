import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet
} from 'react-native';

import Card from './Card';

export default class CompartmentCard extends Component {

    subcompartments = this.props.subComps.map(subInfo => (
        <Text style={styles.sub} key={subInfo.key}>{subInfo.name}</Text>
        )
    );

    render() {
        return(
            <View style={styles.center}>
                <Card myWidth={350} myHeight={80} borRadius={0} lborWidth={10} lborColor={this.props.leftColor}>
                    <Text style={styles.title}>{this.props.compartmentName}</Text>
                    {this.subcompartments}
                </Card>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    center: {
        justifyContent: 'center',
        marginTop: 15
    },
    title: {
        color: '#aaaaaa',
        fontSize: 24,
        fontWeight: '300'
    },
    sub: {
        color: '#aaaaaa',
        fontSize: 16,
        fontWeight: '400'
    }
})
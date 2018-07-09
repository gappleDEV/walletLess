import React, { Component } from 'react';
import {
    Alert,
    View,
    ScrollView,
    TouchableHighlight,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet,
    Dimensions
} from 'react-native';

import CardCompartment from './../Card/CardCompartment';
import MenuHeader from './MenuHeader';

//Data
import comp from './../../data/compartments.json'

export default class Menu extends Component {

    compartments = comp.map(info => (
        <TouchableHighlight key={info.key} onPress={() => this.props.navigation.navigate('DataInputScreen')} underlayColor="transparent">
            <CardCompartment compartmentName={info.compartmentName} leftColor={info.leftColor} percent={info.percent} subComps={info.subComps}/>
        </TouchableHighlight>
    ));

    render() {
        return (
            <View style={styles.container}>
                <MenuHeader style={styles.header} name={'Gregory'}/>
                <ScrollView style={styles.scroll}>
                    {this.compartments}
                </ScrollView>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        //flexDirection: 'column'
    },
    header: {
        //flex: 1
    },
    scroll: {
        backgroundColor: '#f8f8f8',
    }
});
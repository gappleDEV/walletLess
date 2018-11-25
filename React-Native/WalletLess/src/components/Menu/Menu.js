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
import personal from './../../data/personal.json'
import insurance from './../../data/insurance.json'


import bank from './../../data/bank.json'

export default class Menu extends Component {

    /*compartments = comp.map(info => (
        <TouchableHighlight key={info.key} onPress={() => this.props.navigation.navigate('DataInputScreen',{
            sections: this.compartmentInputs[ind++ % this.compartmentInputs.length], //must be changed to point to compartmentInputs[info.key]
          })} underlayColor="transparent">
            <CardCompartment compartmentName={info.compartmentName} leftColor={info.leftColor} percent={info.percent} subComps={info.subComps}/>
        </TouchableHighlight>
    ));*/

    getCompartments() {
        let toRet = [];

        compartmentInputs = [personal, insurance, bank];
    
        for(let i = 0; i < compartmentInputs.length; i++) {
            info = comp[i];
            toRet.push( 
            <TouchableHighlight key={info.key} onPress={() => this.props.navigation.navigate('DataInputScreen',{
                sections: compartmentInputs[i], //must be changed to point to compartmentInputs[info.key]
              })} underlayColor="transparent">
                <CardCompartment compartmentName={info.compartmentName} leftColor={info.leftColor} percent={info.percent} subComps={info.subComps}/>
            </TouchableHighlight>);
        }
        return toRet;
    }

    render() {
        return (
            <View style={styles.container}>
                <MenuHeader style={styles.header} name={'Michael'}/>
                <ScrollView style={styles.scroll}>
                    {this.getCompartments()}
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
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
import comp from './../../data/compartments.json';
import personal from './../../data/personal.json';
import insurance from './../../data/insurance.json';
import motorVehicle from './../../data/motorVehicle.json';
import creditCard from './../../data/creditCard.json';
import bank from './../../data/bank.json';
import prescription from './../../data/prescription.json';

export default class Menu extends Component {

    constructor(props) {
        super(props);
        this.state = {
            realm: null
        };
    }

    getCompartments() {
        let toRet = [];

        compartmentInputs = [personal, insurance, motorVehicle, creditCard, bank, prescription];
    
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

        const { navigation } = this.props;
        const realm = navigation.getParam('realm', {});

        const fName = realm
      ? realm.objects('Personal')[0].firstName
      : 'Loading...';

        return (
            <View style={styles.container}>
                <MenuHeader style={styles.header} name={fName}/>
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
        backgroundColor: '#AFB6C0',
    }
});
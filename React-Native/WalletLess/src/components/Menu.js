import React, { Component } from 'react';
import {
    View,
    ScrollView,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet,
    Dimensions
} from 'react-native';

import CompartmentCard from './CompartmentCard';
import MenuHeader from './MenuHeader';

let screenHeight = Dimensions.get('window').height;


export default class Menu extends Component {

    compartments = this.props.myCompartments.map(info => (
        <CompartmentCard key={info.key} compartmentName={info.compartmentName} leftColor={info.leftColor} percent={info.percent} subComps={info.subComps} />
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
        /*flex: 1,
        flexDirection: 'column'*/
    },
    header: {
        //flex: 1
    },
    scroll: {
        backgroundColor: '#f8f8f8',
        height: screenHeight
    }
});
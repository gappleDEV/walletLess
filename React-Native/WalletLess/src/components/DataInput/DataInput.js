import React, { Component } from 'react';
import {
    View,
    Text,
    TouchableHighlight,
    ScrollView,
    StyleSheet,
} from 'react-native';
import FloatingLabelInput from './../FloatingLabelInput/FloatingLabelInput';
import FontAwesome, { Icons } from 'react-native-fontawesome';

import Card from '../Card/Card';

export default class DataInput extends Component {

    render() {

        const { navigation } = this.props;
        const sections = navigation.getParam('sections', {});

        inputSections = sections.map(section => (
            <Card key={section.key} myWidth={350} borRadius={0} padBot={20} marBot={20} marTop={5}>
                <Text key={section.key}>{section.sectionName}</Text>
                {section.input.map(input => (
                    <FloatingLabelInput
                        key={input.key}
                        label={input.label}
                        dataName={input.dataName}
                        value=""
                    />
                ))}
            </Card>
        ));

        return (
            <View style={styles.dataInputContainer}>
                <ScrollView style={styles.scroll}>
                    {inputSections}
                </ScrollView>
                <View style={styles.buttonContainer}>
                    <TouchableHighlight onPress={() => this.props.navigation.navigate('MenuScreen')} underlayColor="transparent">
                        <View style={styles.button}><Text style={styles.text}>Save</Text></View>
                    </TouchableHighlight>
                    <TouchableHighlight onPress={() => this.props.navigation.navigate('MenuScreen')} underlayColor="transparent">
                        <View style={styles.button}><Text style={styles.text}>Cancel</Text></View>
                    </TouchableHighlight>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    dataInputContainer: {
        flex: 1
    },
    scroll: {
        backgroundColor: "#f8f8f8",
        flex: 9,
    },
    buttonContainer: {
        height: 50,
        flexDirection: 'row', 
        justifyContent: 'space-around',
        backgroundColor: '#c0c0c0',
        paddingTop: 5
    },
    button: {
      width: 150,
      height: 50,
      backgroundColor: '#1976d2',
      justifyContent: 'center',
      alignItems: 'center',
      marginBottom: 25,
      borderRadius: 10
    },
    text: {
      color: '#f0f0f0'
    }
});
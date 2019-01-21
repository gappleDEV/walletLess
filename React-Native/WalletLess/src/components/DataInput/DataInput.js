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

    constructor(props) {
        super(props);
        const { navigation } = this.props;
        this.state = {
            realm: navigation.getParam('realm', {}),
            saveObj: {}
        };

    }

    valueChange = (schemaName, dataName, value) => {
        if(!this.state.saveObj[schemaName]) {
            let obj = this.state.saveObj;
            obj[schemaName] = {
                id: 1
            };
            this.setState(prevState => ({
                ...prevState,
                saveObj: obj
            }));
        }
        let obj = this.state.saveObj;
        obj[schemaName][dataName] = value;
        this.setState(prevState => ({
            ...prevState,
            saveObj: obj
        }));
        this.saveChangesMadeToRealm();
    }

    saveChangesMadeToRealm() {
        let keys = Object.keys(this.state.saveObj);
        for(let i = 0; i < keys.length; i++) {
            let schema = keys[i];
            if(this.state.saveObj.hasOwnProperty(schema)) {
                this.state.realm.write(() => {
                    this.state.realm.create(schema, this.state.saveObj[schema], true);
                });
            }
        }
    }

    render() {

        const { navigation } = this.props;
        const sections = navigation.getParam('sections', {});

        //Ensure that a realm object is created for each that we need to save to
        sections.forEach((section) => {
            let schemaInfo = this.state.realm.objects(section.schemaName);
            if(schemaInfo.length == 0) {
                this.state.realm.write(() => {
                    this.state.realm.create(section.schemaName, {id: 1}, true);
                });
            }
        });

        inputSections = sections.map(section => (
            <Card key={section.key} myWidth={350} borRadius={0} padBot={20} marBot={20} marTop={5}>
                <Text style={styles.sectionHeader} key={section.key}>{section.sectionName}</Text>
                {section.input.map(input => (
                    <FloatingLabelInput
                        key={input.key}
                        label={input.label}
                        valueChange={this.valueChange}
                        schemaName={section.schemaName}
                        dataName={input.dataName}
                        value={this.state.realm.objects(section.schemaName)[0][input.dataName] ? 
                            this.state.realm.objects(section.schemaName)[0][input.dataName].toString() : 
                            ""}
                    />
                ))}
            </Card>
        ));

        return (
            <View style={styles.dataInputContainer}>
                <ScrollView style={styles.scroll}>
                    {inputSections}
                </ScrollView>
                {/*<View style={styles.buttonContainer}>
                    <TouchableHighlight onPress={() => this.props.navigation.navigate('MenuScreen')} underlayColor="transparent">
                        <View style={styles.button}><Text style={styles.text}>Save</Text></View>
                    </TouchableHighlight>
                    <TouchableHighlight onPress={() => this.props.navigation.navigate('MenuScreen')} underlayColor="transparent">
                        <View style={styles.button}><Text style={styles.text}>Cancel</Text></View>
                    </TouchableHighlight>
                </View>*/}
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
    },
    sectionHeader: {
        color: '#888888',
        height: 25,
        fontSize: 22,
        fontWeight: '200',
    }
});
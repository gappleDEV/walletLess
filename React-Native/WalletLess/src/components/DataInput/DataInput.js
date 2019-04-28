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
import CardHeader from '../Card/CardHeader';
import { c } from '../../styles/common';

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
            <Card key={section.key} myWidth={350} borRadius={3} padBot={20} marBot={20} marTop={5}>
                <CardHeader key={section.key} title={section.sectionName}></CardHeader>
                <View style={{paddingLeft: 12, paddingRight: 12}}>
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
                </View>
            </Card>
        ));

        return (
            <View style={styles.dataInputContainer}>
                <ScrollView style={styles.scroll}>
                    {inputSections}
                </ScrollView>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    dataInputContainer: {
        flex: 1
    },
    scroll: {
        backgroundColor: c.grayBodyBg.backgroundColor,
        flex: 9,
    },
});
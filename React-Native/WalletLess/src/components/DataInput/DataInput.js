import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    ScrollView,
    StyleSheet
} from 'react-native';
import FloatingLabelInput from './../FloatingLabelInput/FloatingLabelInput';
import FontAwesome, { Icons } from 'react-native-fontawesome';

export default class DataInput extends Component {

    render() {

        const { navigation } = this.props;
        const sections = navigation.getParam('sections', {});

        inputSections = sections.map(section => (
            <View>
                <Text key={section.key}>{section.sectionName}</Text>
                {section.input.map(input => (
                    <FloatingLabelInput 
                    key={input.key}
                    label={input.label}
                    dataName={input.dataName}
                    value=""
                    />
                ))}
            </View>
        ));

        return (
            <ScrollView style={styles.scroll}>
                {inputSections}
            </ScrollView>
        );
    }
}

const styles = StyleSheet.create({
    scroll: {
        backgroundColor: "#f8f8f8",
    }
});
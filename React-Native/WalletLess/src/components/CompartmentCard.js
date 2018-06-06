import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet
} from 'react-native';
import ProgressCircle from 'react-native-progress-circle'

import Card from './Card';

export default class CompartmentCard extends Component {

    getSubs = () => {
        toRet = [];
        len = this.props.subComps.length;
        // 2 sub compartments per column
        for(i = 0; i < len; i+=2) {
            subInfo1 = this.props.subComps[i];
            subInfo2 = this.props.subComps[i+1];

            if(subInfo2) {
                toRet.push(
                    <View key={i} style={styles.subContainer}>
                        <Text style={styles.sub} key={subInfo1.key}>{subInfo1.name}</Text>
                        <Text style={styles.sub} key={subInfo2.key}>{subInfo2.name}</Text>
                    </View>
                );
            } else {
                toRet.push(
                    <View key={i} style={styles.subContainer}>
                        <Text style={styles.sub} key={subInfo1.key}>{subInfo1.name}</Text>
                    </View>
                );
            }
        }
        return toRet;
    };

    /*subcompartments = this.props.subComps.map((subInfo, i) => (
        <Text style={styles.sub} key={subInfo.key}>{subInfo.name}</Text>
        )
    );*/

    render() {
        return(
            <View style={styles.outerView}>
                <Card myWidth={350} myHeight={80} borRadius={0} lborWidth={10} lborColor={this.props.leftColor}>
                    <View style={styles.rowAlign}>
                        <View style={styles.container}>
                            <Text style={styles.title}>{this.props.compartmentName}</Text>
                            <View style={{flexDirection: 'row'}}>
                                {this.getSubs()}
                            </View>
                        </View>
                        <View style={styles.center}>
                            <ProgressCircle
                                percent={this.props.percent}
                                radius={25}
                                borderWidth={4}
                                color="#3399FF"
                                shadowColor="#999"
                                bgColor="#fff">
                                <Text style={{ fontSize: 9 }}>{this.props.percent + "%"}</Text>
                            </ProgressCircle>
                        </View>
                    </View>
                </Card>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    outerView: {
        marginTop: 15
    },
    rowAlign: {
        flexDirection: 'row'
    },
    container: {
        flex: 6
    },
    title: {
        color: '#aaaaaa',
        fontSize: 24,
        fontWeight: '300'
    },
    center: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    subContainer: {
        flexDirection: 'column',
        width: 150
    },
    sub: {
        color: '#aaaaaa',
        fontSize: 16,
        fontWeight: '400'
    }
})
import React, { Component } from 'react';
import {
    View,
    StatusBar,
    TextInput,
    Text,
    Animated,
    StyleSheet
} from 'react-native';
import MaterialIcon from 'react-native-vector-icons/MaterialIcons';
import MaterialCommunityIcon from 'react-native-vector-icons/MaterialCommunityIcons';


import Card from './Card';

export default class CardCompartment extends Component {

    constructor(props) {
        super(props);
        this.state = { 
          percent: 0 
        };
      }

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
                        <View style={{flexDirection: 'row', marginTop: 5}}>
                            <View style={styles.bullet}></View>
                            <Text style={styles.sub} key={subInfo1.key}>{subInfo1.name}</Text>
                        </View>
                        <View style={{flexDirection: 'row', marginTop: 5}}>
                            <View style={styles.bullet}></View>
                            <Text style={styles.sub} key={subInfo2.key}>{subInfo2.name}</Text>
                        </View>
                    </View>
                );
            } else {
                toRet.push(
                    <View key={i} style={styles.subContainer}>
                        <View style={{flexDirection: 'row', marginTop: 5}}>
                            <View style={styles.bullet}></View>
                            <Text style={styles.sub} key={subInfo1.key}>{subInfo1.name}</Text>
                        </View>
                    </View>
                );
            }
        }
        return toRet;
    };

    render() {
        return(
            <View style={styles.outerView}>
                <Card myWidth={350} myHeight={84} borRadius={5}>
                    <View style={styles.rowAlign}>
                        <View style={styles.container}>
                            <Text style={styles.title}>{this.props.compartmentName}</Text>
                            <View style={{flexDirection: 'row'}}>
                                {this.getSubs()}
                            </View>
                        </View>
                        <View style={styles.center}>
                            <View style={styles.percentContainer}>
                                <MaterialIcon name={'bookmark'} style={styles.bookmark} />
                                <Text style={styles.percentText}>{this.state.percent + '%'}</Text>
                            </View>
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
        flex: 5
    },
    title: {
        color: '#D4DCE8',
        fontSize: 22,
        fontWeight: '300'
    },
    center: {
        flex: 2,
        justifyContent: 'flex-end',
        alignItems: 'flex-end'
    },
    subContainer: {
        flexDirection: 'column',
        width: 135,
        paddingLeft: 5
    },
    bullet: {
        backgroundColor: '#AFB6C0', 
        height: 6, 
        width: 6, 
        borderRadius: 6, 
        marginTop: 6, 
        marginRight: 3
    },
    sub: {
        color: '#AFB6C0',
        fontSize: 14,
        fontWeight: '400'
    },
    percentContainer: {
        flex: 1,
        position: 'absolute',
        top: -20,
        justifyContent: 'center',
        alignItems: 'center'
    },
    bookmark: {
        color: '#17B7C8', 
        fontSize: 70,
    },
    percentText: {
        position: 'absolute',
        color: '#5F6368',
        fontSize: 16
    }
})
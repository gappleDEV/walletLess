import React, { Component } from 'react';
import {
  View,
  Alert,
  Text,
  StyleSheet,
  Image,
  Modal,
  FlatList,
  TouchableHighlight
} from 'react-native';
import MaterialIcon from 'react-native-vector-icons/MaterialIcons';

//Custom components
import SingleReport from './SingleReport';
import Card from '../Card/Card';
import FloatingLabelInput from './../FloatingLabelInput/FloatingLabelInput';

//Data
import pureform from './../../data/reports/pureform';
import pulledOver from './../../data/reports/pulledOver';

export default class Reports extends Component {

  constructor(props) {
    super(props);
    this.state = {
      realm: this.props.screenProps.realm,
      dataSource: {},
      selected: new Map(),
      modalVisible: false,
      viewInput: null,
      saveObj: {}
    };
  }

  componentDidMount() {
    reportInputs = [pureform, pulledOver]
    this.setState({
      dataSource: reportInputs,
      inputTitle: null
    });
  }

  _onPressItem = (id, index) => {
    this.setState((state) => {
      // copy the map rather than modifying state.
      const selected = new Map(state.selected);
      selected.set(id, !selected.get(id)); // toggle
      return { selected, inputTitle: id };
    });
    this.setupSection(index, 0); //TBD: need to get first index
    this.setModalVisible(true);
  }

  setModalVisible(visible) {
    this.setState({ modalVisible: visible });
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

  setupSection(dataInd, page) {
    let section = this.state.dataSource[dataInd].sections[page];
    if (section.type === "text") {
      let inputSections = [];
      for (let i = 0; i < section.input.length; i++) {
        let input = section.input[i];
        inputSections.push(
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
        )
      }
      this.setState(prevState => ({
        ...prevState,
        viewInput: inputSections
      }));
    } else {
      //not yet implemented for pictures
    }
  }

  render() {

    return (
      <View style={styles.MainContainer}>
        <FlatList
          data={this.state.dataSource}
          extraData={this.state}
          numColumns={2}
          keyExtractor={(item, index) => index}

          renderItem={({ item, index }) => (

            <View style={{ flex: 1, flexDirection: 'column', margin: 1 }}>
              <SingleReport id={item.title}
                index={index}
                onPressItem={this._onPressItem}
                selected={!!this.state.selected.get(item.title)}></SingleReport>
            </View>
          )}
        />
        <Modal
          animationType="fade"
          transparent={true}
          visible={this.state.modalVisible}
          onRequestClose={() => {
            Alert.alert('Modal has been closed.');
          }}>
          <View style={styles.modalView}>
            <View style={styles.inputArea}>
              <Text>{this.state.inputTitle}</Text>
              <TouchableHighlight
                onPress={() => {
                  this.setModalVisible(!this.state.modalVisible);
                }}>
                <MaterialIcon name={'cancel'} style={styles.cancelIcon} />
              </TouchableHighlight>
              <Card myWidth={300} myHeight={400} borRadius={5}>
                {this.state.viewInput}
              </Card>

            </View>
          </View>
        </Modal>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  MainContainer: {
    justifyContent: 'center',
    flex: 1,
  },
  modalView: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'rgba(0,0,0,0.5)'
  },
  inputArea: {
    backgroundColor: '#AFB6C0',
    width: 325,
    height: 550
  },
  cancelIcon: {
    fontSize: 14,
    color: '#17b7c8'
  }

});
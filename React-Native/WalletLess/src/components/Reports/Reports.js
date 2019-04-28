import React, { Component } from 'react';
import {
  Platform,
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
import LinearGradient from 'react-native-linear-gradient';
import call from 'react-native-phone-call';

//Custom components
import SingleReport from './SingleReport';
import Card from '../Card/Card';
import FloatingLabelInput from './../FloatingLabelInput/FloatingLabelInput';
import TakePicture from './../Picture/TakePicture';

//Data
import pureform from './../../data/reports/pureform';
import pulledOver from './../../data/reports/pulledOver';
import { c } from '../../styles/common';

const font = Platform.select({
  ios: 'System',
  android: 'Roboto',
});

const colors = {
  bg: '#2f3c51',
  text: '#afb6c0',
  logIn: '#e4ebed',
  gradStart: '#17b7c8',
  gradEnd: '#3abcb4'
}

export default class Reports extends Component {

  constructor(props) {
    super(props);
    this.state = {
      realm: this.props.screenProps.realm,
      selected: new Map(),
      modalVisible: false,
      viewInput: null,
      saveObj: {},
      buttonText: "Next",
      pageInd: -1,
      dataInd: -1,
      dataSource: {}
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
    this.setState(prevState => ({
      ...prevState,
      pageInd: 0,
      dataInd: index
    }));
    this.setState((state) => {
      // copy the map rather than modifying state.
      const selected = new Map(state.selected);
      selected.set(id, !selected.get(id)); // toggle
      return { selected, inputTitle: id };
    });
    this.setupSection(index, 0);
    this.setModalVisible(true);
  }

  setModalVisible(visible) {
    this.setState({ modalVisible: visible });
  }

  valueChange = (schemaName, dataName, value) => {
    if (!this.state.saveObj[schemaName]) {
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
    for (let i = 0; i < keys.length; i++) {
      let schema = keys[i];
      if (this.state.saveObj.hasOwnProperty(schema)) {
        this.state.realm.write(() => {
          this.state.realm.create(schema, this.state.saveObj[schema], true);
        });
      }
    }
  }

  setupSection(dataInd, page) {
    let sections = this.state.dataSource[dataInd].sections;
    let buttonText = "Done";
    if (page < sections.length - 1) {
      buttonText = "Next";
    }
    let inputSections = [];
    for (let s = 0; s < sections.length; s++) {
      let section = sections[s];
      switch (section.type) {
        case "text":
          let textInputs = [];
          for (let i = 0; i < section.input.length; i++) {
            let input = section.input[i];
            textInputs.push(
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
          inputSections.push(
            <View key={s}>{textInputs}</View>
          );
          break;
        case "picture":
          inputSections.push(
            <View style={{justifyContent: 'center', alignItems: 'center'}}>
              <TakePicture pHeight={455} pWidth={310}>
              </TakePicture>
            </View>
          );
          break;
        case "call":
          const args = {
            number: section.phoneNumber, // Use commas to add time between digits.
            prompt: true
          }
          inputSections.push(
            <View key={s} style={{justifyContent: 'center', alignItems: 'center',}}>
              <TouchableHighlight
                style={styles.callButton}
                activeOpacity={0.5}
                underlayColor='transparent'
                onPress={() => {
                  call(args).catch(console.error);
                }}>
                <Text style={styles.callText}>{section.label}</Text>
              </TouchableHighlight>
            </View>
          );
          break;
        default:
          console.log("Unrecognized section type");
      }
    }
    this.setState(prevState => ({
      ...prevState,
      viewInput: inputSections,
      buttonText: buttonText
    }));

  }

  previouslInputForReport() {
    if (this.state.pageInd - 1 < 0) {
      this.setModalVisible(false);
    } else {
      let buttonText = "Next";
      this.setState(prevState => ({
        ...prevState,
        pageInd: this.state.pageInd - 1,
        buttonText: buttonText
      }));
    }
  }

  continueWithReport() {
    if (this.state.buttonText == "Done") {
      this.setModalVisible(false);
    } else {
      let sections = this.state.dataSource[this.state.dataInd].sections;
      let buttonText = "Done";
      if (this.state.pageInd + 1 < sections.length - 1) {
        buttonText = "Next";
      }
      this.setState(prevState => ({
        ...prevState,
        pageInd: this.state.pageInd + 1,
        buttonText: buttonText
      }));
    }
  }

  render() {

    const viewToShow = this.state.pageInd != -1 && this.state.viewInput ?
      this.state.viewInput[this.state.pageInd] :
      <Text>Loading...</Text>;

    return (
      <View style={styles.MainContainer}>
        <FlatList
          style={{marginTop:10}}
          data={this.state.dataSource}
          extraData={this.state}
          numColumns={2}
          keyExtractor={(item, index) => index}

          renderItem={({ item, index }) => (

            <View style={{flex: 1, width: 150, flexDirection: 'column', marginLeft: 15, marginRight: 15}}>
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
              <View style={styles.titleContainer}>
                <Text style={styles.title}>{this.state.inputTitle}</Text>
                <TouchableHighlight
                  onPress={() => {
                    this.setModalVisible(!this.state.modalVisible);
                  }}>
                  <MaterialIcon name={'cancel'} style={styles.cancelIcon} />
                </TouchableHighlight>
              </View>
              <View style={styles.bodyContent}>
                <Card myWidth={310} myHeight={455} borRadius={5}>
                  <View style={{paddingLeft: 12, paddingRight: 12}}>
                    {viewToShow}
                  </View>
                </Card>
                <View style={styles.buttonContainer}>
                  <TouchableHighlight
                    style={styles.bcButton}
                    activeOpacity={0.5}
                    underlayColor='transparent'
                    onPress={() => {
                      this.previouslInputForReport();
                    }}>
                    <LinearGradient
                      start={{ x: 0, y: 0 }} end={{ x: 1, y: 0 }}
                      colors={[c.purple.backgroundColor, c.purple.borderColor]}
                      style={styles.bcButton}>
                      <Text style={styles.buttonText}>Back</Text>
                    </LinearGradient>
                  </TouchableHighlight>
                  <TouchableHighlight
                    style={styles.bcButton}
                    activeOpacity={0.5}
                    underlayColor='transparent'
                    onPress={() => {
                      this.continueWithReport();
                    }}>
                    <LinearGradient
                      start={{ x: 0, y: 0 }} end={{ x: 1, y: 0 }}
                      colors={[c.blue.backgroundColor, c.blue.borderColor]}
                      style={styles.bcButton}>
                      <Text style={styles.buttonText}>{this.state.buttonText}</Text>
                    </LinearGradient>
                  </TouchableHighlight>
                </View>
              </View>
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
    backgroundColor: c.grayBodyBg.backgroundColor
  },
  modalView: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'rgba(0,0,0,0.5)'
  },
  inputArea: {
    backgroundColor: c.gray2.backgroundColor,
    width: 345,
    height: 600
  },
  titleContainer: {
    display: 'flex',
    flexDirection: 'row',
    height: 30,
    margin: 10
  },
  title: {
    flex: 1,
    fontSize: 26,
    color: c.gray4.color
  },
  cancelIcon: {
    flex: 1,
    textAlign: 'right',
    fontSize: 24,
    color: c.gray4.color
  },
  bodyContent: {
    alignItems: 'center'
  },
  buttonContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between'
  },
  bcButton: {
    padding: 10,
    width: 80,
    height: 60,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 40,
    marginTop: 10,
    marginLeft: 40,
    marginRight: 40
  },
  buttonText: {
    color: c.gray1.color,
    fontFamily: font,
    fontWeight: '300',
    fontSize: 18
  },
  callButton: {
    padding: 10,
    width: 275,
    height: 48,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 5,
    marginTop: 100,
    borderColor: c.gray3.color,
    borderWidth: 1
  },
  callText: {
    color: c.gray3.color,
    fontFamily: font,
    fontWeight: '300',
    fontSize: 24
  }
});
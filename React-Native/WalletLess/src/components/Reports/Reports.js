import React, { Component } from 'react';
import {
  View,
  Text,
  StyleSheet,
  Image,
  FlatList,
  TouchableHighlight
} from 'react-native';

//Custom components
import SingleReport from './SingleReport';

//Data
import pureform from './../../data/reports/pureform';
import pulledOver from './../../data/reports/pulledOver';

export default class Reports extends Component {

  constructor() {
    super();
    this.state = {
      dataSource: {},
      selected: new Map()
    };
  }

  componentDidMount() {
    reportInputs = [pureform, pulledOver]
    this.setState({
      dataSource: reportInputs,
    });
  }

  _onPressItem = (id) => {
    this.setState((state) => {
      // copy the map rather than modifying state.
      const selected = new Map(state.selected);
      selected.set(id, !selected.get(id)); // toggle
      return { selected };
    });
  }

  render() {
    return (
      <View style={styles.MainContainer}>
        <FlatList
          data={this.state.dataSource}
          extraData={this.state}
          numColumns={2}
          keyExtractor={(item, index) => index}

          renderItem={({ item }) => (

            <View style={{ flex: 1, flexDirection: 'column', margin: 1 }}>
              <SingleReport id={item.title}
                onPressItem={this._onPressItem}
                selected={!!this.state.selected.get(item.title)}></SingleReport>
            </View>

          )}          
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  MainContainer: {
    justifyContent: 'center',
    flex: 1,
  }
});
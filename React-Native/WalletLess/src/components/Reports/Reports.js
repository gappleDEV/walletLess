import React, { Component } from 'react';
import {
  View,
  Text,
  StyleSheet,
  Image,
  FlatList,
  TouchableHighlight
} from 'react-native';

import SingleReport from './SingleReport';

export default class Reports extends Component {

  constructor() {
    super();
    this.state = {
      dataSource: {},
      selected: new Map()
    };
  }

  componentDidMount() {
    var that = this;
    let items = Array.apply(null, Array(60)).map((v, i) => {
      return { id: i, num: (i + 1) };
    });
    that.setState({
      dataSource: items,
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
              <SingleReport id={item.id}
                onPressItem={this._onPressItem}
                selected={!!this.state.selected.get(item.id)}></SingleReport>
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
  },
  imageThumbnail: {
    justifyContent: 'center',
    alignItems: 'center',
    textAlign: 'center',
    height: 100,
  },
});
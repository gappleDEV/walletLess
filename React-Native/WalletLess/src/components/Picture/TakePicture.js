import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  View,
  Text,
  Dimensions,
  TouchableHighlight,
  Image
} from 'react-native';
import { RNCamera as Camera } from 'react-native-camera';
import MaterialCommunityIcon from 'react-native-vector-icons/MaterialCommunityIcons';

// Colors
import { c } from '../../styles/common';

export default class TakePicture extends Component {

  constructor(props) {
    super(props);
    this.state = {
      path: null,
    };
  }

  takePicture = async () => {
    try {
      const data = await this.camera.takePictureAsync();
      this.setState({ path: data.uri });
      // this.props.updateImage(data.uri);
      // console.log('Path to image: ' + data.uri);
    } catch (err) {
      console.log('err: ', err);
    }
  };

  renderCamera() {

    return (
      <Camera
        ref={(cam) => {
          this.camera = cam;
        }}
        style={[styles.preview, {height: this.props.pHeight, width: this.props.pWidth}]}
        flashMode={Camera.Constants.FlashMode.off}
        permissionDialogTitle={'Permission to use camera'}
        permissionDialogMessage={'We need your permission to use your camera phone'}
      >
        <TouchableHighlight
          style={styles.capture}
          onPress={this.takePicture.bind(this)}
          underlayColor="rgba(255, 255, 255, 0.5)"
        >
          <View />
        </TouchableHighlight>
      </Camera>
    );
  }

  renderImage() {
    return (
      <View>
        <Image
          source={{ uri: this.state.path }}
          style={[styles.preview, {height: this.props.pHeight, width: this.props.pWidth}]}
        />
        <TouchableHighlight onPress={() => this.setState({ path: null })} underlayColor="transparent"
         style={[styles.retakeContainer,  styles.common, {right: (this.props.pWidth / 2) - 35}]}>
          <MaterialCommunityIcon name={'camera-party-mode'} style={styles.retakeIcon}/>
        </TouchableHighlight>
      </View>
    );
  }

  render() {
    return (
      <View style={styles.container}>
        {this.state.path ? this.renderImage() : this.renderCamera()}
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#000',
  },
  preview: {
    justifyContent: 'flex-end',
    alignItems: 'center',
  },
  capture: {
    width: 70,
    height: 70,
    borderRadius: 35,
    borderWidth: 5,
    borderColor: '#FFF',
    marginBottom: 15,
  },
  retakeContainer: {
    position: 'absolute',
    bottom: 20,
  },
  retakeIcon: {
    fontSize: 70,
    color: c.gray2.color,
    opacity: 0.85,
  },
  common: {
    width: 70,
    height: 70,
    justifyContent: 'center',
    alignItems: 'center',
    shadowOpacity: 0.3,
    shadowRadius: 3,
    shadowOffset: {
        height: 3,
        width: 3
    },
  }
});
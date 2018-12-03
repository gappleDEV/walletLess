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
        style={styles.preview}
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
          style={styles.preview}
        />
        <TouchableHighlight onPress={() => this.setState({ path: null })} underlayColor="transparent">
          <View style={[styles.retakeContainer,  styles.common]}>
            <Text>
              Retake
            </Text>
          </View>
        </TouchableHighlight>
        <TouchableHighlight onPress={() => this.setState({ path: null })} underlayColor="transparent">
          <View style={[styles.saveContainer,  styles.common]}>
            <Text>
              Save
            </Text>
          </View>
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
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#000',
  },
  preview: {
    flex: 1,
    justifyContent: 'flex-end',
    alignItems: 'center',
    height: Dimensions.get('window').height,
    width: Dimensions.get('window').width
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
    right: 40,
    bottom: 20,
    borderWidth: 2,
    borderColor: '#FF584C',
  },
  saveContainer: {
    position: 'absolute',
    left: 40,
    bottom: 20,
    borderWidth: 2,
    borderColor: '#3399FF',
  },
  common: {
    color: '#888888',
    fontWeight: '600',
    width: 100,
    height: 50,
    justifyContent: 'center',
    alignItems: 'center',
    fontSize: 17,
    paddingLeft: 20,
    paddingRight: 20,
    paddingTop: 10,
    paddingBottom: 10,
    borderRadius: 50,
    backgroundColor: 'rgba(245, 245, 245, 0.6)',
    shadowOpacity: 0.3,
    shadowRadius: 3,
    shadowOffset: {
        height: 3,
        width: 3
    }
  }
});
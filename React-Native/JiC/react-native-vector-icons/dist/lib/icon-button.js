var _interopRequireDefault=require("@babel/runtime/helpers/interopRequireDefault");var _interopRequireWildcard=require("@babel/runtime/helpers/interopRequireWildcard");Object.defineProperty(exports,"__esModule",{value:true});exports.default=createIconButtonComponent;var _extends2=_interopRequireDefault(require("@babel/runtime/helpers/extends"));var _objectWithoutProperties2=_interopRequireDefault(require("@babel/runtime/helpers/objectWithoutProperties"));var _classCallCheck2=_interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));var _createClass2=_interopRequireDefault(require("@babel/runtime/helpers/createClass"));var _possibleConstructorReturn2=_interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));var _getPrototypeOf2=_interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));var _inherits2=_interopRequireDefault(require("@babel/runtime/helpers/inherits"));var _isString=_interopRequireDefault(require("lodash/isString"));var _omit=_interopRequireDefault(require("lodash/omit"));var _pick=_interopRequireDefault(require("lodash/pick"));var _react=_interopRequireWildcard(require("react"));var _propTypes=_interopRequireDefault(require("prop-types"));var _reactNative=require("./react-native");var _jsxFileName="/home/travis/build/oblador/react-native-vector-icons/lib/icon-button.js";var styles=_reactNative.StyleSheet.create({container:{flexDirection:'row',justifyContent:'flex-start',alignItems:'center',padding:8},touchable:{overflow:'hidden'},icon:{marginRight:10},text:{fontWeight:'600',backgroundColor:'transparent'}});var IOS7_BLUE='#007AFF';var TEXT_PROP_NAMES=['ellipsizeMode','numberOfLines','textBreakStrategy','selectable','suppressHighlighting','allowFontScaling','adjustsFontSizeToFit','minimumFontScale'];var TOUCHABLE_PROP_NAMES=['accessible','accessibilityLabel','accessibilityHint','accessibilityComponentType','accessibilityRole','accessibilityStates','accessibilityTraits','onFocus','onBlur','disabled','onPress','onPressIn','onPressOut','onLayout','onLongPress','nativeID','testID','delayPressIn','delayPressOut','delayLongPress','activeOpacity','underlayColor','selectionColor','onShowUnderlay','onHideUnderlay','hasTVPreferredFocus','tvParallaxProperties'];function createIconButtonComponent(Icon){var _class,_temp;return _temp=_class=function(_PureComponent){(0,_inherits2.default)(IconButton,_PureComponent);function IconButton(){(0,_classCallCheck2.default)(this,IconButton);return(0,_possibleConstructorReturn2.default)(this,(0,_getPrototypeOf2.default)(IconButton).apply(this,arguments));}(0,_createClass2.default)(IconButton,[{key:"render",value:function render(){var _this$props=this.props,style=_this$props.style,iconStyle=_this$props.iconStyle,children=_this$props.children,restProps=(0,_objectWithoutProperties2.default)(_this$props,["style","iconStyle","children"]);var iconProps=(0,_pick.default)(restProps,TEXT_PROP_NAMES,'style','name','size','color');var touchableProps=(0,_pick.default)(restProps,TOUCHABLE_PROP_NAMES);var props=(0,_omit.default)(restProps,Object.keys(iconProps),Object.keys(touchableProps),'iconStyle','borderRadius','backgroundColor');iconProps.style=iconStyle?[styles.icon,iconStyle]:styles.icon;var colorStyle=(0,_pick.default)(this.props,'color');var blockStyle=(0,_pick.default)(this.props,'backgroundColor','borderRadius');return _react.default.createElement(_reactNative.TouchableHighlight,(0,_extends2.default)({style:[styles.touchable,blockStyle]},touchableProps,{__source:{fileName:_jsxFileName,lineNumber:118}}),_react.default.createElement(_reactNative.View,(0,_extends2.default)({style:[styles.container,blockStyle,style]},props,{__source:{fileName:_jsxFileName,lineNumber:122}}),_react.default.createElement(Icon,(0,_extends2.default)({},iconProps,{__source:{fileName:_jsxFileName,lineNumber:123}})),(0,_isString.default)(children)?_react.default.createElement(_reactNative.Text,{style:[styles.text,colorStyle],__source:{fileName:_jsxFileName,lineNumber:125}},children):children));}}]);return IconButton;}(_react.PureComponent),_class.propTypes={backgroundColor:_propTypes.default.oneOfType([_propTypes.default.string,_propTypes.default.number]),borderRadius:_propTypes.default.number,color:_propTypes.default.oneOfType([_propTypes.default.string,_propTypes.default.number]),size:_propTypes.default.number,iconStyle:_propTypes.default.any,style:_propTypes.default.any,children:_propTypes.default.node},_class.defaultProps={backgroundColor:IOS7_BLUE,borderRadius:5,color:'white',size:20},_temp;}
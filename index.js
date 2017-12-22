'use strict';

import { NativeModules } from 'react-native';

const { RNNativeToaster } = NativeModules;

var ToastNative = {
    //Toast duration constants
    SHORT: RNNativeToaster.SHORT,
    LONG: RNNativeToaster.LONG,

    // Toast gravity constants
    TOP: RNNativeToaster.TOP,
    BOTTOM: RNNativeToaster.BOTTOM,
    CENTER: RNNativeToaster.CENTER,

    show: function (message,
                    duration,
                    position,
                    styles) {
        RNNativeToaster.show(message || "This is a toast message", duration || ToastNative.SHORT, position || ToastNative.TOP, styles || {});
    }
};

export default ToastNative;


import 'dart:async';

import 'package:flutter/services.dart';

class FlutterUiModeManager {
  /// method channel definition
  static const MethodChannel _channel =
      const MethodChannel('flutter_ui_mode_manager');

  /// Get device user interface mode
  static Future<UiMode> get getDeviceUiMode async {
    final String iuMode = await _channel.invokeMethod('getDeviceUiMode');
    if(iuMode == 'tv'){
      return UiMode.UI_MODE_TYPE_TELEVISION;
    }else if(iuMode == "watch"){
      return UiMode.UI_MODE_TYPE_WATCH;
    }else if(iuMode == "normal"){
      return UiMode.UI_MODE_TYPE_NORMAL;
    }else if(iuMode == "desk"){
      return UiMode.UI_MODE_TYPE_DESK;
    }else if(iuMode == "appliance"){
      return UiMode.UI_MODE_TYPE_APPLIANCE;
    }else if(iuMode == "mask"){
      return UiMode.UI_MODE_TYPE_MASK;
    }else if(iuMode == "car"){
      return UiMode.UI_MODE_TYPE_CAR;
    }else if(iuMode == "undefined"){
      return UiMode.UI_MODE_TYPE_UNDEFINED;
    }else if(iuMode == "vr_handset"){
      return UiMode.UI_MODE_TYPE_VR_HEADSET;
    } else{
      return UiMode.UI_MODE_UNKNOWN;
    }
  }
}

/// Available android ui modes
enum UiMode {UI_MODE_TYPE_TELEVISION, UI_MODE_TYPE_WATCH, UI_MODE_TYPE_NORMAL,UI_MODE_TYPE_DESK,UI_MODE_TYPE_APPLIANCE, UI_MODE_TYPE_MASK, UI_MODE_TYPE_CAR, UI_MODE_TYPE_UNDEFINED, UI_MODE_TYPE_VR_HEADSET, UI_MODE_UNKNOWN }

package com.hustlance.flutter_ui_mode_manager

import android.app.Activity
import android.app.UiModeManager;
import android.content.Context.UI_MODE_SERVICE
import android.content.res.Configuration;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** FlutterUiModeManagerPlugin */
public class FlutterUiModeManagerPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.flutterEngine.dartExecutor, "flutter_ui_mode_manager")
    channel.setMethodCallHandler(this)
  }

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_ui_mode_manager")
      channel.setMethodCallHandler(FlutterUiModeManagerPlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getDeviceUiMode") {
      val device =  getDeviceUiMode()

      result.success(device)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun getDeviceUiMode() : String {

    val uiModeManager = this.activity.getSystemService(UI_MODE_SERVICE) as UiModeManager
    if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_TELEVISION) {
      return "tv"
    } else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_WATCH) {
      return "watch"
    } else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_NORMAL) {
      return "normal"
    } else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_DESK) {
      return "desk"
    } else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_APPLIANCE) {
      return "appliance"
    } else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_MASK) {
      return "mask"
    }else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_CAR) {
      return "car"
    }else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_UNDEFINED) {
      return "undefined"
    }else if (uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_VR_HEADSET) {
      return "vr_handset"
    }
    return "unknown"
  }



  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }
}

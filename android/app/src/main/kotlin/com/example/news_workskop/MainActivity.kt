package com.example.news_workskop

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    // MethodChannel(flutterView, "samples.flutter.dev/battery").setMethodCallHandler { call, result ->
    //   if (call.method == "getBatteryLevel") {
    //     val batteryLevel = getBatteryLevel()
    //     if (batteryLevel != -1) {
    //       result.success(batteryLevel)
    //     } else {
    //       result.error("UNAVAILABLE", "Battery level not available.", null)
    //     }
    //   } else {
    //     result.notImplemented()
    //   }
    // }
  }
}

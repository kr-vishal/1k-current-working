// ForegroundServicePlugin.java
package com.example.memes_classification

import android.content.Context
import android.content.Intent
import com.example.memes_classification.ForegroundService
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class ForegroundServicePlugin : FlutterPlugin, MethodCallHandler {
    private var context: Context? = null
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "startService") {
            startForegroundService()
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    private fun startForegroundService() {
        val serviceIntent = Intent(context, ForegroundService::class.java)
        context!!.startService(serviceIntent)
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {}

    companion object {
        private const val CHANNEL = "flutter_tflite_foreground"
    }
}

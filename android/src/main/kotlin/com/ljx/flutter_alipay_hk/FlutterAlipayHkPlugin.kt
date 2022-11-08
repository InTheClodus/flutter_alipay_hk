package com.ljx.flutter_alipay_hk

import android.app.Activity
import android.os.AsyncTask
import androidx.annotation.NonNull
import com.alipay.sdk.app.PayTask

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterAlipayHkPlugin */
class FlutterAlipayHkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  private var mActivity: Activity? = null
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_alipay_hk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "pay" -> {
        val payInfo = call.argument<String>("payInfo")
        pay(mActivity, payInfo, result)
      }
      "pay2" -> {
        val payInfo = call.argument<String>("payInfo")
        pay2(mActivity,payInfo,result)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  fun pay(currentActivity: Activity?, payInfo: String?, callback: Result) {
    object : AsyncTask<String?, Any?, Map<String?, String?>>() {
      override fun onPostExecute(result: Map<String?, String?>) {
        val error = result["\$error"]
        if (error != null) {
          callback.error(error, "支付发生错误", null)
        } else {
          callback.success(result)
        }
      }

      override fun doInBackground(vararg params: String?): Map<String?, String?> {
        return try {
          val alipay = PayTask(currentActivity)
          alipay.payV2(payInfo, true)
        } catch (e: Exception) {
          val result: MutableMap<String?, String?> =
            HashMap()
          result["\$error"] = e.message
          result
        }
      }
    }.execute()


//    Thread payThread = new Thread(payRunnable);
//    payThread.start();
  }

  fun pay2(activity: Activity?,payInfo: String?,callback:Result){
    val alipay = PayTask(activity)
    try {
      val result = alipay.payV2(payInfo,true)
      callback.success(result)
    }catch (e:Exception){
      val result: MutableMap<String?, String?> =
        HashMap()

      callback.error("404","预期之外的错误",e.message)
    }

  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    mActivity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

  }

  override fun onDetachedFromActivity() {

  }
}

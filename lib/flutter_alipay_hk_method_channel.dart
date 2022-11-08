import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'alipay_result.dart';
import 'flutter_alipay_hk_platform_interface.dart';

/// An implementation of [FlutterAlipayHkPlatform] that uses method channels.
class MethodChannelFlutterAlipayHk extends FlutterAlipayHkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_alipay_hk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<AlipayResult> pay(String payInfo) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'payInfo': payInfo,
    };
    var res = await methodChannel.invokeMethod('pay', params);
    return AlipayResult(result: res['result'],resultStatus: res['resultStatus'],memo: res['memo']);
  }

  /// 判断是否安装了支付宝
  @override
  Future<bool> isInstalled() async {
    var res = await methodChannel.invokeMethod('isInstalled');
    return res['result'];
  }

  /// ios专用
  @override
  Future setIosUrlSchema(String urlSchema) async {
    if(Platform.isIOS){
      await methodChannel.invokeMethod('setIosUrlSchema',{"schema":urlSchema});
    }
  }
}

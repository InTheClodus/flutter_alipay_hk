import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'alipay_result.dart';
import 'flutter_alipay_hk_method_channel.dart';

abstract class FlutterAlipayHkPlatform extends PlatformInterface {
  /// Constructs a FlutterAlipayHkPlatform.
  FlutterAlipayHkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAlipayHkPlatform _instance = MethodChannelFlutterAlipayHk();

  /// The default instance of [FlutterAlipayHkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAlipayHk].
  static FlutterAlipayHkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAlipayHkPlatform] when
  /// they register themselves.
  static set instance(FlutterAlipayHkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<AlipayResult> pay(String payInfo) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// 判断是否安装了支付宝
  Future<bool> isInstalled() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// ios专用
  Future setIosUrlSchema(String urlSchema) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

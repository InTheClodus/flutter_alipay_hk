import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_alipay_hk/flutter_alipay_hk.dart';
import 'package:flutter_alipay_hk/flutter_alipay_hk_platform_interface.dart';
import 'package:flutter_alipay_hk/flutter_alipay_hk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAlipayHkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAlipayHkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAlipayHkPlatform initialPlatform = FlutterAlipayHkPlatform.instance;

  test('$MethodChannelFlutterAlipayHk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAlipayHk>());
  });

  test('getPlatformVersion', () async {
    FlutterAlipayHk flutterAlipayHkPlugin = FlutterAlipayHk();
    MockFlutterAlipayHkPlatform fakePlatform = MockFlutterAlipayHkPlatform();
    FlutterAlipayHkPlatform.instance = fakePlatform;

    expect(await flutterAlipayHkPlugin.getPlatformVersion(), '42');
  });
}

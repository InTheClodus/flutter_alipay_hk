
import 'alipay_result.dart';
import 'flutter_alipay_hk_platform_interface.dart';

class FlutterAlipayHk {
  Future<String?> getPlatformVersion() {
    return FlutterAlipayHkPlatform.instance.getPlatformVersion();
  }

  Future<AlipayResult?> pay(String payInfo) {
    return FlutterAlipayHkPlatform.instance.pay(payInfo);
  }
  Future<bool> isInstalled(){
    return FlutterAlipayHkPlatform.instance.isInstalled();
  }
  Future<void> setIosUrlSchema(String urlSchema){
    return FlutterAlipayHkPlatform.instance.setIosUrlSchema(urlSchema);
  }
}

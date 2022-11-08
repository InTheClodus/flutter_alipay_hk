import 'package:flutter/material.dart';
import 'package:flutter_alipay_hk/alipay_result.dart';
import 'package:flutter_alipay_hk/flutter_alipay_hk.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}



class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  String _payInfo = "alipay_root_cert_sn=687b59193f3f462dd5336e5abf83c5d8_02941eef3187dddf3d3b83462e1dfcf6&alipay_sdk=alipay-sdk-php-2020-04-15&app_cert_sn=9092af0d19a61f915f99823b48f46c62&app_id=2021003110654914&biz_content=%7B%22out_trade_no%22%3A%22N22042318593750220%22%2C%22total_amount%22%3A%220.11%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22time_expire%22%3A%222022-04-23+19%3A00%3A37%22%2C%22quit_url%22%3A%22http%3A%5C%2F%5C%2Fwww.cxhb.net.cn%22%2C%22passback_params%22%3A%22item%22%2C%22subject%22%3A%22%E7%9B%9B%E8%BF%AA%E5%8A%A0%22%2C%22body%22%3A%22Test%22%7D&charset=utf-8&format=json&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Fwww.cxhb.net.cn%2Fapi%2Fnotice%2Fpayment&sign_type=RSA2&timestamp=2022-04-23+18%3A59%3A37&version=1.0&sign=KObwyOmntYrekC2UQOABk1hMduAb8oNlcwUp05qoaEOBpVlab%2FtiMCJQRMM9uz7H%2Ff8DfUkbLhBlMaCb3pDLGs%2BzuSNJeLjd1g0C6tNIolnGx%2B3Bee5EQVxzac9SwsiGuJirY";
  AlipayResult? _payResult;

  onChanged(String value) {
    _payInfo = value;
  }

  callAlipay() async {
    dynamic payResult;
    try {
      print("The pay info is : $_payInfo");
      payResult = await FlutterAlipayHk().pay(_payInfo);
    } on Exception catch (e) {
      payResult = null;
    }

    if (!mounted) return;

    setState(() {
      _payResult = payResult;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alipay example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(onPressed: callAlipay, child: const Text("调用支付宝")),
            Text(_payResult == null ? "" : _payResult.toString())
          ],
        ),
      ),
    );
  }
}

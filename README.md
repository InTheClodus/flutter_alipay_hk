# flutter_alipay_hk
香港支付宝支付插件

## 功能列表

* 调用支付


## 安装

增加依赖 pubspec.yaml
```yaml
dependencies:
  flutter_alipay_hk: 
  git: https://github.com/InTheClodus/flutter_alipay_hk.git
```

## 开始

* ios集成



+ 在info.plist增加一条URL scheme

```cmake
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>org.zoomdev.flutter.alipay</string>
            </array>
        </dict>
    </array>
```
如果需要定制URL scheme可以这么做：

+ 或者

```cmake
 <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>__YOUR APP SCHEME NAME__</string>
            </array>
        </dict>
    </array>
```

然后在app中调用

```dart
await FlutterAlipayHk.setIosUrlSchema('YOUR APP SCHEME NAME');
```



## 使用
```dart
import 'package:flutter_alipay_hk/alipay_result.dart';
import 'package:flutter_alipay_hk/flutter_alipay_hk.dart';
```


* 调取支付

```dart
var result = await FlutterAlipayHk.pay("you pay info from server");
```



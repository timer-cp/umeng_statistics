
import 'dart:async';

import 'package:flutter/services.dart';

class UmengStatistics {
  static const MethodChannel _channel =
      const MethodChannel('umeng_statistics');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

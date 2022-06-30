import 'package:flutter/foundation.dart';
import 'dart:io' as io;

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'android':  CustomPlatform.android,
    'linux':    CustomPlatform.linux,
    'macos':    CustomPlatform.macos,
    'windows':  CustomPlatform.windows,
    'ios':      CustomPlatform.ios,
    'fuchsia':  CustomPlatform.fuchsia,
    'web':      CustomPlatform.web,
  };

  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }
    return _platformMap[io.Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static CustomPlatform get platform => _getPlatform();

  static String _getOperatingSystem() {
    if (kIsWeb) {
      return 'web';
    }
    return io.Platform.operatingSystem;
  }

  static String get operatingSystem => _getOperatingSystem();

  static bool get isMobile => platform == CustomPlatform.ios || platform == CustomPlatform.android;
}

enum CustomPlatform {
  android,
  linux,
  macos,
  windows,
  ios,
  fuchsia,
  web,
  undefined
}
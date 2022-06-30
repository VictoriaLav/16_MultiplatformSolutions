import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'app_platform.dart';

Widget webView(String link) => AppPlatform.isMobile
    ? WebView(
        initialUrl: link,
      )
    : const Text('');

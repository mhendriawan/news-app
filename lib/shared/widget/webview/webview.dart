import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared.dart';

class CustomWebView extends StatelessWidget {
  const CustomWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.darkPrimary,
      appBar: AppBar(
        backgroundColor: ColorPalettes.darkPrimary,
        elevation: 0,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}

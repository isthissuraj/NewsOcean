import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailWebView extends StatefulWidget {
  String newsURL;

  DetailWebView({super.key, required this.newsURL});

  @override
  State<DetailWebView> createState() => _DetailWebViewState();
}

class _DetailWebViewState extends State<DetailWebView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.newsURL = widget.newsURL.contains("http:")
        ? widget.newsURL.replaceAll("http:", "https:")
        : widget.newsURL;
  }

  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Ocean"),
        backgroundColor: Colors.deepPurple,
      ),
      body: WebView(
        initialUrl: widget.newsURL,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          setState(() {
            controller.complete(webViewController);
          });
        },
      ),
    );
  }
}

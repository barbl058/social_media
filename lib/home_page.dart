import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WebViewController? _controller;

  bool ready = false;

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  Future<void> _initialize() async {
    // source = await rootBundle.loadString('assets/tiktok_embed.html');
    // final uri = Uri.dataFromString(source!, mimeType: 'text/html');
    final uri = Uri.parse(
      // 'https://storage.googleapis.com/lunts-dev.appspot.com/TIK%20TOK%20Video.html',
      // 'https://storage.googleapis.com/lunts-dev.appspot.com/IG%20Reel.html',
      'https://storage.googleapis.com/lunts-dev.appspot.com/IG%20Post.html',
    );

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('$progress%');
          },
          onPageStarted: (String url) {
            print('$url started');
          },
          onPageFinished: (String url) {
            print('$url finished');
          },
          onWebResourceError: (WebResourceError error) {
            print(error);
          },
          onNavigationRequest: (NavigationRequest request) =>
              NavigationDecision.navigate,
        ),
      )
      ..loadRequest(uri);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebViewWidget(controller: _controller!),
    );
  }
}

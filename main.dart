import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(WhatsTrackApp());
}

class WhatsTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WhatsAppWebLogin(),
    );
  }
}

class WhatsAppWebLogin extends StatefulWidget {
  @override
  _WhatsAppWebLoginState createState() => _WhatsAppWebLoginState();
}

class _WhatsAppWebLoginState extends State<WhatsAppWebLogin> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsTrack - Web Login"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.reload(),
          )
        ],
      ),
      body: WebView(
        initialUrl: 'https://web.whatsapp.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
        },
        onPageFinished: (url) {
          print("Loaded: $url");
        },
      ),
    );
  }
}

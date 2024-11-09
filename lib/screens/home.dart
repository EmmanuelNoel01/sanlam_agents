import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WebViewController? webViewController;
  bool isLoading = true; // Loading state variable

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          setState(() {
            isLoading = false; 
          });
        },
        onNavigationRequest: (request) {
          if (request.url == "https://agency.sanlam4u.co.ug") {
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
        },
      ))
      ..loadRequest(Uri.https("agency.sanlam4u.co.ug"))
      ..clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: webViewController!), 
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
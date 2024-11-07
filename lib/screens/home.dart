import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WebViewController? webViewController;
  @override
  void initState() {
    webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
      onNavigationRequest: (request) {
        if(request.url == "https://agency.sanlam4u.co.ug"){
          return NavigationDecision.prevent;
        } else {
          return NavigationDecision.navigate;
        }
      },
    ))
    ..loadRequest(Uri.https("agency.sanlam4u.co.ug"))
    ..clearCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewController !=null ? WebViewWidget(controller: webViewController!)
      : Container(),
      ) );
  }
}
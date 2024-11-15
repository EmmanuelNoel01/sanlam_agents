// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewController webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeDownloader();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          setState(() {
            isLoading = false;
          });
        },
        onNavigationRequest: (request) {
          if (_isDownloadableFile(request.url)) {
            _downloadFile(request.url);
            return NavigationDecision.prevent; 
          }
          return NavigationDecision.navigate; 
        },
      ))
      ..loadRequest(Uri.parse("https://agency.sanlam4u.co.ug"))
      ..clearCache();
  }

  Future<void> _initializeDownloader() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize(debug: true);
  }

  bool _isDownloadableFile(String url) {
    return url.endsWith('.pdf') || url.endsWith('.zip') || url.endsWith('.docx') || url.endsWith('.xlsx');
  }

  Future<void> _downloadFile(String url) async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (status.isDenied) {
        throw 'Storage permission is needed to download files.';
      }
    }

    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: '/storage/emulated/0/Download', 
      showNotification: true,
      openFileFromNotification: true, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: webViewController),
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

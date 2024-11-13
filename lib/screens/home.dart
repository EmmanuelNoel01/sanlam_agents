// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WebViewController? webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          setState(() {
            isLoading = false; // Hide loader when page finishes loading
          });
        },
        onNavigationRequest: (request) {
          // Check if the URL is a download link
          if (isDownloadLink(request.url)) {
            downloadFile(request.url);
            return NavigationDecision.prevent; // Prevent navigation
          } else {
            setState(() {
              isLoading = true; // Show loader when navigating to a new page
            });
            return NavigationDecision.navigate;
          }
        },
      ))
      ..loadRequest(Uri.https("agency.sanlam4u.co.ug"))
      ..clearCache();
  }

  bool isDownloadLink(String url) {
    // Simple check for file extensions to identify download links
    return url.endsWith('.pdf') || url.endsWith('.doc') || url.endsWith('.xls');
  }

  Future<void> downloadFile(String url) async {
    try {
      // Specify the download directory
      String downloadPath = '/storage/emulated/0/Download/';
      String fileName = Uri.parse(url).pathSegments.last; // Get the original file name
      String filePath = '$downloadPath$fileName'; // Full path for the file

      Dio dio = Dio();
      await dio.download(url, filePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File downloaded to: $filePath')),
      );
    } catch (e) {
      print("Download error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download file')),
      );
    }
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
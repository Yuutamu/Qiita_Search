import 'package:flutter/material.dart';
import 'package:qiita_api_search/models/article.dart';
import 'package:webview_flutter/webview_flutter.dart'; // webview_flutterをimport

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({
    super.key,
    required this.article,
  });

  final Article article;

  @override 
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late WebViewController controller = WebViewController()
    ..loadRequest(
      Uri.parse(widget.article.url),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article page'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

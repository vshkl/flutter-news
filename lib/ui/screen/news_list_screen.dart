import 'package:flutter/material.dart';

import '/ui/organism/news_list.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter News'),
      ),
      body: const Center(
        child: NewsList(),
      ),
    );
  }
}

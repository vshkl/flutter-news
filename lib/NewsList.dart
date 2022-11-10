import 'package:flutter/material.dart';

import 'model/News.dart';

import 'NewsRow.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _news = List<News>.generate(
    10000,
    ((index) => News(
        title: 'Flutter 4.0',
        author: 'user${index + 1}name',
        points: index + 1,
        comments: index + 1)),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: _news.length,
      itemBuilder: (context, index) {
        return NewsRow(news: _news[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8.0);
      },
    );
  }
}

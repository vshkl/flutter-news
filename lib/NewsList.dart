import 'package:flutter/material.dart';

import 'model/News.dart';

import 'NewsRow.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _news = <News>[
    const News(
        title: 'Flutter 1.0', author: 'flutter', points: 100, comments: 110),
    const News(
        title: 'Flutter 2.0', author: 'flutter', points: 200, comments: 120),
    const News(
        title: 'Flutter 3.0', author: 'flutter', points: 300, comments: 130),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: _news.length,
      itemBuilder: (context, index) {
        final news = _news[index];
        return NewsRow(
          title: news.title,
          author: news.author,
          points: news.points,
          comments: news.comments,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8.0);
      },
    );
  }
}

import 'package:flutter/widgets.dart';

import 'News.dart';

import 'NewsRow.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _news = <News>[
    const News(
        title: 'Flutter 2.0',
        author: 'Flutter Team',
        points: 100,
        comments: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}

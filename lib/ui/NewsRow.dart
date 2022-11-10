import 'package:flutter/material.dart';

import '/model/News.dart';

class NewsRow extends StatelessWidget {
  const NewsRow({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4.0),
            Text(
              'by @${news.author}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 8.0),
            Text(
              '${news.points} points • ${news.comments} comments',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}

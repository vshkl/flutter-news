import 'package:flutter/material.dart';
import 'package:flutter_news/ui/atom/author_label.dart';

import '/model/news.dart';

import '/ui/atom/author_label.dart';
import '/ui/atom/stats_label.dart';

class NewsRow extends StatelessWidget {
  const NewsRow({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4.0),
              AuthorLabel(username: news.author),
              const SizedBox(height: 8.0),
              StatsLabel(
                pointsCount: news.points,
                commentsCount: news.comments,
              ),
            ],
          ),
        )
      ],
    );
  }
}

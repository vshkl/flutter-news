import 'package:flutter/material.dart';

class NewsRow extends StatelessWidget {
  const NewsRow(
      {super.key,
      required this.title,
      required this.author,
      required this.points,
      required this.comments});

  final String title;
  final String author;
  final int points;
  final int comments;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'by @$author',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 4.0),
            Text(
              '$points points • $comments comments',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}

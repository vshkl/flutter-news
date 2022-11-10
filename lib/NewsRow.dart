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
      children: [
        Column(
          children: [
            Text(title),
            Text('by @$author'),
            Row(
              children: [
                Text('$points points'),
                Text('$comments comments'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

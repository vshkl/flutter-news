import 'package:flutter/material.dart';

class LabelStats extends StatelessWidget {
  const LabelStats({
    super.key,
    required this.pointsCount,
    required this.commentsCount,
  });

  final int pointsCount;
  final int commentsCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$pointsCount points • $commentsCount comments',
      style: Theme.of(context).textTheme.caption,
    );
  }
}

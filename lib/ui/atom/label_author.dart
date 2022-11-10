import 'package:flutter/material.dart';

class LabelAuthor extends StatelessWidget {
  const LabelAuthor({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Text(
      'by @$username',
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}

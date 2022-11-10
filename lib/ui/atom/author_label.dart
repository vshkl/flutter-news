import 'package:flutter/material.dart';

class AuthorLabel extends StatelessWidget {
  const AuthorLabel({
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

import 'package:flutter/material.dart';

class RowError extends StatelessWidget {
  const RowError({
    super.key,
    required this.error,
  });

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error:\n$error'),
    );
  }
}

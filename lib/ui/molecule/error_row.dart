import 'package:flutter/material.dart';

class ErrorRow extends StatelessWidget {
  const ErrorRow({
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

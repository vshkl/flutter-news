import 'package:flutter/material.dart';

class ViewNoResults extends StatelessWidget {
  const ViewNoResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No results found',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

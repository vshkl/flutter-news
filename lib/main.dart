import 'package:flutter/material.dart';

import '/ui/screen/news_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const NewsListScreen(),
    );
  }
}

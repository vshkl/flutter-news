import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/model/News.dart';

import 'NewsRow.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<News> news = snapshot.data!;
            return ListView.separated(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsRow(news: news[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8.0);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

Future<List<News>> fetchNews() async {
  final response = await http
      .get(Uri.parse('https://hn.algolia.com/api/v1/search?query=flutter'));

  if (response.statusCode == 200) {
    // return News.fromJson(jsonDecode(response.body));
    return jsonDecode(response.body)['hits']
        .cast<Map<String, dynamic>>()
        .map<News>((json) => News.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load news');
  }
}

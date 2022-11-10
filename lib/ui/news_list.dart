import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_news/model/News.dart';
import 'package:flutter_news/ui/news_row.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late int page;
  late GlobalKey<PaginationViewState> key;

  @override
  void initState() {
    page = -1;
    key = GlobalKey<PaginationViewState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaginationView<News>(
      key: key,
      itemBuilder: (BuildContext context, News news, int index) =>
          NewsRow(news: news),
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 0.0, color: Colors.grey),
      pageFetch: fetchNews,
      pullToRefresh: true,
      onError: (dynamic error) => Center(
        child: Text('Error happened:\n$error'),
      ),
      onEmpty: const Center(
        child: Text('No Flutter news found'),
      ),
      bottomLoader: const Center(
        child: CircularProgressIndicator(),
      ),
      initialLoader: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

Future<List<News>> fetchNews(int page) async {
  final response = await http.get(Uri.parse(
      'https://hn.algolia.com/api/v1/search?query=flutter&page=$page'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['hits']
        .cast<Map<String, dynamic>>()
        .map<News>((json) => News.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load news');
  }
}

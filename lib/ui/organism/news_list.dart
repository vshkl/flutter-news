import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:http/http.dart' as http;

import '/model/news.dart';

import '/ui/atom/divider_hairline.dart';
import '/ui/molecule/row_error.dart';
import '/ui/molecule/indicator_loading.dart';
import '/ui/molecule/row_news.dart';
import '/ui/molecule/view_no_results.dart';

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
          RowNews(news: news),
      separatorBuilder: (BuildContext context, int index) =>
          const DividerHairline(),
      pageFetch: fetchNews,
      pullToRefresh: true,
      onError: (dynamic error) => RowError(error: error),
      onEmpty: const ViewNoResults(),
      bottomLoader: const IndicatorLoading(),
      initialLoader: const IndicatorLoading(),
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

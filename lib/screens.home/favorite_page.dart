import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './widgets/news_card.dart';
import './news_detail.dart';
import '../data/news.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    _fetchNews();
    super.initState();
  }

  // Logic Here.

  List<News> news = List<News>();
  bool _isLoading = false;

  Future<void> _fetchNews() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=81909d6a83034f77ae99082eeb0fe700');
    var responseJson = json.decode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(responseJson);
    setState(() {
      news = newsResponse.articles; // List ของ News
      _isLoading = false;
    });
  }

  void openDetailPage(News news) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NewsDetailPage(news: news)));
  }

  // Widget UI

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Center(
                child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  openDetailPage(news[index]);
                },
                child: NewsCard(news[index]),
              );
            },
          )));
  }
}

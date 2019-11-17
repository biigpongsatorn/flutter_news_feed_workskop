import 'package:flutter/material.dart';
import '../../data/news.dart';

class NewsCard extends StatelessWidget {
  NewsCard(this.news);
  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          news.urlToImage != null
              ? Image.network(news.urlToImage)
              : Image.asset('assets/images/news-cover.png'),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                news.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(news.publishedAt),
          )
        ],
      ),
    );
  }
}

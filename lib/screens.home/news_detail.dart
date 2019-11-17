import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/news.dart';

class NewsDetailPage extends StatefulWidget {
  NewsDetailPage({Key key, this.news}) : super(key: key);
  News news;
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    var body = SafeArea(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          widget.news.urlToImage != null
              ? Image.network(widget.news.urlToImage)
              : Image.asset('assets/images/news-cover.png'),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.news.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.news.publishedAt),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.topLeft,
            child: Text(widget.news.content),
          )
        ],
      ),
    ));
    return Scaffold(appBar: AppBar(title: Text(widget.news.title)), body: body);
  }
}

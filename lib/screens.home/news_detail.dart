import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/news.dart';

class NewsDetailPage extends StatefulWidget {
  NewsDetailPage({Key key, this.news }) : super(key: key);
  News news;
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    var body = SafeArea(child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.network(widget.news.cover),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.news.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.news.createdAt.toString()),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.topLeft,
            child: Text(widget.news.content),
          )
        ],
      ),
    ));
    return Platform.isIOS
      ? CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(widget.news.title)),
        child: body
      )
      : Scaffold(
      appBar: AppBar(
        title: Text(widget.news.title)
      ),
      body: body
    );
  }
}

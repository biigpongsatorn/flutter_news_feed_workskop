import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './screens.home/home_page.dart';
import './configs/config.dart';

class MyApp extends StatelessWidget {
  final Config config;

  MyApp(this.config);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoApp(home: MyHomePage(title: config.appName))
    : MaterialApp(
      title: 'NEWS',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: config.appName),
    );
  }
}
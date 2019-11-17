import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './screens.home/home_page.dart';
import './configs/config.dart';
import 'package:provider/provider.dart';
import './model/counter.dart';

class MyApp extends StatelessWidget {
  final Config config;
  final CounterModel model = CounterModel();

  MyApp(this.config);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
        builder: (_) => model,
        child: MaterialApp(
          title: 'NEWS',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MyHomePage(title: config.appName),
        ));
  }
}

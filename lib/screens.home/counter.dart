import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/counter.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    var body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You have pushed the button this many times:'),
          Text(
            counterModel.getCounter().toString(),
            style: Theme.of(context).textTheme.display1,
          ),
          RaisedButton(
              onPressed: counterModel.increment, child: Text('Increment')),
          RaisedButton(
              onPressed: counterModel.decrement, child: Text('Decrement'))
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: body);
  }
}

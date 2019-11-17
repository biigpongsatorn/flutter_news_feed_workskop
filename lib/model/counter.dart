// import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;

  // int get counter => _counter;
  getCounter() => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

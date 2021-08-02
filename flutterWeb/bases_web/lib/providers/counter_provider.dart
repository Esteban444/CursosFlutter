import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 10;

  get counter {
    return this._counter;
  }

  void increment() {
    this._counter++;
    notifyListeners();
  }

  void decrement() {
    this._counter--;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../model/color_item.dart';

class MyAppState extends ChangeNotifier {
  bool isError;
  ColorItem? _color;
  
  ColorItem? get color => _color;

  MyAppState({this.isError = false});

  set color(ColorItem? value) {
    if (value == _color) {
      return;
    }
    _color = value;
    notifyListeners();
  }
}
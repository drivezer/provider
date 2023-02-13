import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  String? text;

  setText(value) {
    text = value;
  }

  getText() {
    return text ?? '';
  }
}

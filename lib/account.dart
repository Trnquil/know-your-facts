import 'package:flutter/material.dart';

class Account {
  Account({
    this.title = "",
    image,
    this.label = "",
    this.statementsfrom = const [],
    this.statementsabout = const [],
    this.statementsrelevant = const [],
  });

  String title;
  Image? image;
  String label;
  List<String> statementsfrom;
  List<String> statementsabout;
  List<String> statementsrelevant;
}

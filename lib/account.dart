import 'package:flutter/material.dart';

class Account {
  Account(
      {this.title = "", image, this.statements = const [], this.label = ""});

  String title;
  Image? image;
  List<String> statements;
  String label;
}

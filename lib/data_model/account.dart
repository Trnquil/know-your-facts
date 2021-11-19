import 'package:flutter/material.dart';

class Statement {
  Statement({this.statement = "",
        this.isFactual = false,
        this.description = "",
        this.date,
        this.author = "",
        this.sources = const []});

  String statement;
  bool isFactual;
  String description;
  DateTime? date;
  String author;
  List<String> sources;
}

class Account {
  Account({
    this.title = "",
    this.image,
    this.label = "",
    this.statementsabout = const [],
    this.statementsfrom = const [],
    this.statementsrelevant = const [],
  });

  String title;
  Image? image;
  String label;
  List<Statement> statementsfrom;
  List<Statement> statementsabout;
  List<Statement> statementsrelevant;
}

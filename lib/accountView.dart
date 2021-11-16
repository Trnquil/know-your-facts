import 'dart:ui';

import 'package:flutter/material.dart';

enum statementType {
  individual,
  about,
  related,
}

extension transformToString on statementType {
  String name() {
    switch (this) {
      case statementType.individual:
        return "By";
      case statementType.about:
        return "Involving";
      case statementType.related:
        return "Related";
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AccountView(
        person: new Account(
            title: "Joseph Robinette Biden Sr.",
            image: Image(image: AssetImage("test/test_data/joe_biden.jpg")),
            label: "Politician",
            statementsabout: [
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"])
        ],
            statementsfrom: [
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: true,
              description: "Factual",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"]),
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"])
        ],
            statementsrelevant: [
          new Statement(
              statement: "Hello",
              isFactual: false,
              description: "False",
              sources: ["me"])
        ])),
  ));
}

class AccountView extends StatefulWidget {
  const AccountView({Key? key, required this.person}) : super(key: key);

  final Account person;

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  statementType _currentType = statementType.individual;
  statementType _typeButton1 = statementType.about;
  statementType _typeButton2 = statementType.related;

  @override
  Widget build(BuildContext context) {
    List<Statement> statements;
    switch (_currentType) {
      case statementType.individual:
        statements = widget.person.statementsfrom;
        break;
      case statementType.about:
        statements = widget.person.statementsabout;
        break;
      case statementType.related:
        statements = widget.person.statementsrelevant;
        break;
    }
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          flexibleSpace: FlexibleSpaceBar(
            title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.person.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "\n"),
                    TextSpan(
                        text: widget.person.label,
                        style: TextStyle(color: Colors.black))
                  ],
                )),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image(
                  image: widget.person.image?.image ??
                      AssetImage("test/test_data/nope-not-here.jpg"),
                  fit: BoxFit.cover,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.grey.withAlpha(0),
                        Colors.white10.withOpacity(0.25),
                        Colors.white38.withOpacity(0.5),
                        Colors.white70.withOpacity(0.75),
                        Colors.white.withOpacity(1)
                      ])),
                ),
              ],
            ),
          ),
          actions: [_FavoriteIcon()],
          pinned: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          stretch: true,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: true,
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(children: [
                            Positioned.fill(
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black87))),
                            Center(
                                child: TextButton(
                              child: Text(_typeButton1.name()),
                              onPressed: () {
                                _changeStatementType(_typeButton1);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(16),
                                fixedSize: Size.fromWidth(
                                    MediaQuery.of(context).size.width / 2 - 25),
                                primary: Colors.white,
                                alignment: Alignment.center,
                                textStyle: TextStyle(fontSize: 18),
                              ),
                            )),
                          ]))),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(children: [
                            Positioned.fill(
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black87))),
                            Center(
                                child: TextButton(
                              child: Text(_typeButton2.name()),
                              onPressed: () {
                                _changeStatementType(_typeButton2);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(16),
                                fixedSize: Size.fromWidth(
                                    MediaQuery.of(context).size.width / 2 - 25),
                                primary: Colors.white,
                                alignment: Alignment.center,
                                textStyle: TextStyle(fontSize: 18),
                              ),
                            )),
                          ]))),
                ],
              ),
            );
          }, childCount: 1),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        statements.elementAt(index).statement +
                            " " +
                            index.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(statements.elementAt(index).description),
                      Text(
                        statements.elementAt(index).isFactual
                            ? "Factual"
                            : "Debatable",
                        style: TextStyle(
                            color: statements.elementAt(index).isFactual
                                ? Colors.green
                                : Colors.red),
                      )
                    ],
                  )));
        }, childCount: statements.length))
      ],
    ));
  }

  void _changeStatementType(statementType _type) {
    switch (_type) {
      case statementType.about:
        setState(() {
          _currentType = statementType.about;
          _typeButton1 = statementType.individual;
          _typeButton2 = statementType.related;
        });
        break;
      case statementType.individual:
        setState(() {
          _currentType = statementType.individual;
          _typeButton1 = statementType.about;
          _typeButton2 = statementType.related;
        });
        break;
      case statementType.related:
        setState(() {
          _currentType = statementType.related;
          _typeButton1 = statementType.individual;
          _typeButton2 = statementType.about;
        });
        break;
    }
  }
}

class _FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<_FavoriteIcon> {
  bool _isFavorited = false;
  IconData _favoriteIcon = IconData(58874, fontFamily: "MaterialIcons");

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: _toggleFavorite, icon: Icon(_favoriteIcon));
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteIcon = IconData(58874, fontFamily: "MaterialIcons");
        _isFavorited = false;
        print("Not Favorite");
      } else {
        _favoriteIcon = IconData(58873, fontFamily: "MaterialIcons");
        _isFavorited = true;
        print("Favorite");
      }
    });
  }
}

class Statement {
  Statement(
      {this.statement = "",
      this.isFactual = false,
      this.description = "",
      this.sources = const []});

  String statement;
  bool isFactual;
  String description;
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

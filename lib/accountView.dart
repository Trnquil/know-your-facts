import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:know_your_facts/data_model/account.dart';
import 'package:know_your_facts/widgets/statementContainer.dart';

// enum to differentiate between the statement types
enum statementType {
  individual,
  about,
  related,
}

// extension of statementType to enable a translation into a string
extension transformToString on statementType {
  String name() {
    switch (this) {
      case statementType.individual:
        return "Individual";
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
        isATest: false,
        entity: new Account(
            title: "Joseph Robinette Biden Sr.",
            image: Image(image: AssetImage("test/test_data/joe_biden.jpg")),
            label: "Politician",
            statementsabout: [
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"])
            ],
            statementsfrom: [
              new Statement(
                  statement:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sapien turpis, semper eget quam ut, aliquet consectetur ipsum. Cras ornare urna metus, quis placerat ex accumsan eget. Integer rhoncus ex non nisl dignissim auctor. Nam in vehicula nisi. Fusce sollicitudin lorem vel felis vehicula, in luctus risus bibendum. Suspendisse eget.",
                  isFactual: false,
                  description: "This is the description of the data that is presented above on Joe Biden.",
                  author: "me",
                  date: DateTime.now(),
                  sources: ["https://www.google.com"]),
              new Statement(
                  statement: "Hello",
                  isFactual: true,
                  description: "Factual",
                  author: "not me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"]),
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"])
            ],
            statementsrelevant: [
              new Statement(
                  statement: "Hello",
                  isFactual: false,
                  description: "False",
                  author: "me",
                  sources: ["me"])
            ])),
  ));
}

/*
AccountView Class:
Creates a View which displays the statements made by an account type entity. It includes a navigation bar that moves out of the way. It can filter statements into three categories.
Input: Account entity
Output: Widget
 */
class AccountView extends StatefulWidget {
  const AccountView(
      {Key? key,
      required this.entity,
      required this.isATest,
      this.selectedType = statementType.individual})
      : super(key: key);

  final Account entity;
  final bool isATest;
  final statementType selectedType;

  @override
  _AccountViewState createState() =>
      _AccountViewState(currentType: selectedType);
}

// State class for AccountView, enables the switching of the displayed statements
class _AccountViewState extends State<AccountView> {
  _AccountViewState({required this.currentType});

  statementType currentType;
  statementType _typeButton1 = statementType.individual;
  Color _buttonColor1 = Color.fromRGBO(0, 0, 0, 0.1);
  statementType _typeButton2 = statementType.about;
  Color _buttonColor2 = Color.fromRGBO(0, 0, 0, 0.1);
  statementType _typeButton3 = statementType.related;
  Color _buttonColor3 = Color.fromRGBO(0, 0, 0, 0.1);

  @override
  Widget build(BuildContext context) {
    // First determine what is the current state and enable the proper statements being displayed
    List<Statement> statements;
    switch (currentType) {
      case statementType.individual:
        statements = widget.entity.statementsfrom;
        break;
      case statementType.about:
        statements = widget.entity.statementsabout;
        break;
      case statementType.related:
        statements = widget.entity.statementsrelevant;
        break;
    }

    // Return the Widget
    return Scaffold(
        // Scroll view for scrolling through the statements, includes a custom navigation bar that displays data from the account class
        body: CustomScrollView(
      slivers: [
        // Navigation Bar
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height /
              2.5, // Height of the Navigation bar when in full screen, should be bigger than 1/3 of the screen height and smaller than 1/2
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            // Displays the data from the passed accounts class in two rows
            title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.entity.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "\n"),
                    TextSpan(
                        text: widget.entity.label,
                        style: TextStyle(color: Colors.black))
                  ],
                )),
            background: Stack(
              fit: StackFit.expand,
              children: [
                //Display the image of the entity, if image is null display a image not found warning
                Image(
                  image: widget.entity.image?.image ??
                      AssetImage("assets/nope-not-here.jpg"),
                  fit: BoxFit.cover,
                ),
                // Generate the grey gradient over the image so that the black text is more readable
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
          // Buttons on the right to be displayed, includes a favorite button that does nothing at the moment
          actions: [_FavoriteIcon()],
          pinned: true, // There is always a navigation bar showing
          backgroundColor: Colors.white,
          centerTitle: true,
          stretch: true,
          foregroundColor: Colors.black,
          // Automatically adds a back button to the previous view
          automaticallyImplyLeading: true,
        ),
        // Generates the two buttons to filter through the statements, the buttons change text dynamically so you can always switch to the other two unselected filters (Sliver List used for simplicity could be any type of sliver)
        !widget.isATest
            ? SliverList(
                delegate:
                    // Generate a child delegate that builds a row of buttons
                    SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            child: MaterialButton(
                                onPressed: () {
                                  _changeStatementType(_typeButton1);
                                },
                                child: Text(_typeButton1.name())),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                border: Border.all(color: _buttonColor1)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: MaterialButton(
                                onPressed: () {
                                  _changeStatementType(_typeButton2);
                                },
                                child: Text(_typeButton2.name())),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: _buttonColor2)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: MaterialButton(
                                onPressed: () {
                                  _changeStatementType(_typeButton3);
                                },
                                child: Text(_typeButton3.name())),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                border: Border.all(color: _buttonColor3)),
                          ),
                        ),
                        // Generate the FilterButtons to filter the statements they take a title and onPressed function as input
                      ],
                    ),
                  );
                }, childCount: 1),
              )
            : SliverPadding(
                padding: EdgeInsets.only(top: 15),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Center(
                        child: Text(
                      currentType.name(),
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ));
                  }, childCount: 1),
                ),
              ),
        // Generate a list of all statements that are currently filtered for
        SliverPadding(
          padding: EdgeInsets.all(0.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                    child: currentType == statementType.individual
                        ? Text('Statements made by ' + widget.entity.title)
                        : currentType == statementType.about
                            ? Text('Statements that directly involve ' +
                                widget.entity.title)
                            : Text('Statements made by entities related to ' +
                                widget.entity.title))
                // Scrollable horizontal widget here
              ],
            ),
          ),
        ),
        statements.length != 0
            ? SliverPadding(
                padding: EdgeInsets.only(bottom: 100),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          // Replace with statement widget
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              StatementContainer(
                                  statement: statements.elementAt(index))
                            ],
                          )));
                }, childCount: statements.length)),
              )
            : SliverPadding(
                padding: EdgeInsets.all(30),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Center(
                      child: Text(
                        "No statements available",
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }, childCount: 1),
                ),
              )
      ],
    ));
  }

  // Check what the current statement type is and generate the correct statements and buttons
  void _changeStatementType(statementType _type) {
    switch (_type) {
      case statementType.about:
        setState(() {
          currentType = statementType.about;
          _buttonColor1 = Color.fromRGBO(0, 0, 0, 0.2);
          _buttonColor2 = Colors.pink;
          _buttonColor3 = Color.fromRGBO(0, 0, 0, 0.2);
        });
        break;
      case statementType.individual:
        setState(() {
          currentType = statementType.individual;
          _buttonColor1 = Colors.pink;
          _buttonColor2 = Color.fromRGBO(0, 0, 0, 0.2);
          _buttonColor3 = Color.fromRGBO(0, 0, 0, 0.2);
        });
        break;
      case statementType.related:
        setState(() {
          currentType = statementType.related;
          _buttonColor1 = Color.fromRGBO(0, 0, 0, 0.2);
          _buttonColor2 = Color.fromRGBO(0, 0, 0, 0.2);
          _buttonColor3 = Colors.pink;
        });
        break;
    }
  }
}

// Create an icon that can be used to pseudo favorite the account, will not be implemented, it's just for show
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

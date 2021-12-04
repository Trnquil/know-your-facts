import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:know_your_facts/accountView.dart';
import 'package:know_your_facts/data_model/suggestion.dart';

import 'constants.dart';
import 'data_model/account.dart';
import 'widgets/pic_tiles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Know Your Facts',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Know Your Facts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isATest = false;
  statementType selectedStatementType = statementType.individual;

  List<Suggestion> getSuggestions(String pattern) {
    //If the user has not given any input yet, return nothing it all
    if (pattern == "") {
      return [];
    }
    List<Suggestion> matches = [];

    RegExp exp = RegExp(
      pattern,
      caseSensitive: false,
    );

    for (Account account in suggestions) {
      if (isATest) {
        if (exp.hasMatch(account.title + " " + statementType.about.name())) {
          matches
              .add(new Suggestion(entity: account, type: statementType.about));
        }
        if (exp
            .hasMatch(account.title + " " + statementType.individual.name())) {
          matches.add(
              new Suggestion(entity: account, type: statementType.individual));
        }
        if (exp.hasMatch(account.title + " " + statementType.related.name())) {
          matches.add(
              new Suggestion(entity: account, type: statementType.related));
        }
      } else {
        if (exp.hasMatch(account.title)) {
          matches.add(new Suggestion(entity: account));
        }
      }
    }

    return matches;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height / 10)),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,15),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1000)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          spreadRadius: 0,
                          blurRadius: 10,
                        )
                      ]),
                  child: TypeAheadField(
                    noItemsFoundBuilder: (context) {
                      return ListTile(
                        leading: Icon(Icons.no_accounts),
                        title: Text("No matches found"),
                      );
                    },
                    textFieldConfiguration: TextFieldConfiguration(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey),
                          hintText:
                              'www.faz.de/yourarticle, Nicky Minaj, Apple, Benjamin Shapiro',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1000))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.pink,
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1000))),
                        )),
                    suggestionsCallback: (pattern) async {
                      return getSuggestions(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      Suggestion _suggestion = suggestion as Suggestion;
                      Account account = _suggestion.entity ?? new Account();
                      return ListTile(
                        leading: Icon(Icons.search),
                        title: Text(account.title),
                        subtitle: Text(isATest
                            ? account.label + " - " + _suggestion.type.name()
                            : account.label),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      Suggestion _suggestion = suggestion as Suggestion;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AccountView(
                                entity: _suggestion.entity as Account,
                                isATest: isATest,
                                selectedType: _suggestion.type,
                              )));
                    },
                  ),
                ),
                PicTiles(
                  accounts: suggestions,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("A Test"),
                    Switch(
                        value: isATest,
                        onChanged: (bool newValue) {
                          setState(() {
                            print(newValue);
                            isATest = newValue;
                          });
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

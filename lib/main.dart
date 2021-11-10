import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<Account> suggestions = [
    Account(title: 'Joe Biden', label: 'Politician'),
    Account(title: 'Apple', label: 'Company'),
    Account(title: 'Apple', label: 'Fruit'),
    Account(title: 'Nicky Minaj', label: 'Singer'),
    Account(title: 'Benjamin Shapiro', label: 'Author'),
    Account(title: 'Jordan Peterson', label: 'Author'),
  ];

  List<Account> getSuggestions(String pattern) {
    //If the user has not given any input yet, return nothing it all
    if (pattern == "") {
      return [];
    }
    List<Account> matches = [];

    for (Account account in suggestions) {
      RegExp exp = RegExp(pattern, caseSensitive: false);
      if (exp.hasMatch(account.title)) {
        matches.add(account);
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
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
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
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                    hintText:
                        'www.faz.de/yourarticle, Nicky Minaj, Apple, Benjamin Shapiro',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(1000))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink,
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(1000))),
                  )),
              suggestionsCallback: (pattern) async {
                return await getSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                Account account = suggestion as Account;
                return ListTile(
                  leading: Icon(Icons.search),
                  title: Text(account.title),
                  subtitle: Text(account.label),
                );
              },
              onSuggestionSelected: (suggestion) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Container()));
              },
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

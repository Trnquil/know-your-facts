import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:know_your_facts/data_model/account.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

DateFormat dateFormatDate = DateFormat("dd.MM.yyyy");
DateFormat dateFormatTime = DateFormat("HH:mm");
const double sidePadding = 20;

class StatementContainer extends StatefulWidget {
  const StatementContainer({Key? key, required this.statement})
      : super(key: key);

  final Statement statement;

  @override
  StatementContainerState createState() => StatementContainerState();
}

class StatementContainerState extends State<StatementContainer> {
  bool isShowMore = false;
  bool isShowSources = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> mainWidgets = [
      Text(
        widget.statement.statement,
        style: TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.left,
      ),
      Padding(padding: EdgeInsets.only(top: 10)),
      RichText(
        textAlign: TextAlign.right,
        text: TextSpan(
          children: [TextSpan(
            text: "Statement by ",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold
              )
          ),
          TextSpan(
            text: widget.statement.author.toString(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline
            )
          ),
          TextSpan(
            text: " on ",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold
              )
          ),
            TextSpan(
              text: (dateFormatDate.format(widget.statement.date?.toLocal() ??
                  DateTime.utc(1970))),
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold
                )
            )
          ]
        ),
        maxLines: 1,
      ),
    ];

    List<Widget> showMoreWidgets = [];

    Widget button;

    if (isShowMore) {
      showMoreWidgets.add(
        Container(
          padding: EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: widget.statement.isFactual ? Colors.green.shade200.withOpacity(0.5019607843137255) : Color.fromRGBO(
                243, 137, 137, 0.5019607843137255),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: EdgeInsets.only(top: 15),),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.statement.isFactual ?
                      "Factual" :
                      "Debatable",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: widget.statement.isFactual ?
                        Colors.green:
                        Colors.red,
                      ),
                    ),
                    IconButton(alignment: Alignment.centerRight, icon: Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey,), onPressed: _showLess,),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10),),
                Text(widget.statement.description,
                textAlign: TextAlign.left,)
              ],
            ),
        ),
      );
      if (isShowSources) {
        List<Widget> listItems = [];
        for(String source in widget.statement.sources) {
          listItems.add(RichText(
            text: TextSpan(
              text: source,
              style: TextStyle(
                color: Colors.blue
              ),
              recognizer: new TapGestureRecognizer() ..onTap = () {launch(source);},
            )
          ));
        }
        showMoreWidgets.add(
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: sidePadding, right: sidePadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:
                listItems
            ),
          )
        );
        button =
          _expandButton(icon: Icons.arrow_upward, title: "Show less", onPressed: _hideSources);
      } else {
        showMoreWidgets.add(
          Padding(
            padding: EdgeInsets.only(top: 10),
          )
        );
        button =
          _expandButton(icon: Icons.arrow_downward, title: "Sources", onPressed: _showSources,);
      }
    } else {
      showMoreWidgets.add(
          Padding(
            padding: EdgeInsets.only(top: 10),
          )
      );
      button =
        _expandButton(icon: Icons.arrow_downward, title: "Details", onPressed: _showMore,);
    }




    return Stack(alignment: Alignment.bottomCenter,
        children: [
          _card(widgetsTop: mainWidgets, widgetsBottom: showMoreWidgets, button: button),
    ]);
  }

  _showMore() {
    setState(() {
      isShowMore = true;
    });
  }

  _showLess() {
    setState(() {
      isShowSources = false;
      isShowMore = false;
    });
  }

  _hideSources() {
    setState(() {
      isShowSources = false;
    });
  }
  _showSources() {
    setState(() {
      isShowMore = true;
      isShowSources = true;
    });
  }

}

class _card extends StatelessWidget {
  const _card({Key? key, this.color = Colors.white, required this.widgetsTop, required this.widgetsBottom, required this.button})
      : super(key: key);
  
  final Color color;
  final List<Widget> widgetsTop;
  final List<Widget> widgetsBottom;
  final Widget button;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.fromLTRB(0,20,0,10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: widgetsTop,
                ),
              ),
              widgetsBottom.isNotEmpty ? Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch, children: widgetsBottom): Container(),
              button,
            ]
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
  
}

class _expandButton extends StatelessWidget {
  const _expandButton({Key? key, required this.icon, required this.title, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      highlightColor: Colors.black12,
      onTap: onPressed,
      onTapCancel: (){},
        borderRadius: BorderRadius.circular(100),
      child: Container(
        width: MediaQuery.of(context).size.width/2.9,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white,),
            Text(title, style: TextStyle(
                color: Colors.white
            )
            ),
          ],
        ),
      )
    );
  }

}

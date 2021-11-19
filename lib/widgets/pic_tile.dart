import 'package:flutter/material.dart';
import 'package:know_your_facts/data_model/account.dart';

class pic_tile extends StatelessWidget {
  Account account;
  int height;
  bool empty;
  pic_tile({required this.account, required this.height, this.empty = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: !empty
          ? Container(
              height: height.toDouble(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: account.image == null ? Image.asset('assets/Warning.png').image : account.image!.image),
                color: Colors.red,
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.expand,
                children: [

                ],
              ),
            )
          : Container(
              height: height.toDouble(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
            ),
    );
  }
}

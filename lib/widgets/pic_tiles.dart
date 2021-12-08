import 'package:flutter/material.dart';

import '../data_model/account.dart';
import 'pic_tile.dart';

class PicTiles extends StatelessWidget {
  List<Account> accounts;
  bool isATest;
  PicTiles({required this.accounts, required this.isATest});

  List<Row> getAccountTiles(List<Account> accounts, int height) {
    List<Row> result = [];
    for (int i = 0; i < accounts.length; i = i + 2) {
      if (i + 1 < accounts.length) {
        result.add(Row(
          children: [
            Expanded(
                child: pic_tile(
              account: accounts[i],
              height: height,
              isATest: isATest,
            )),
            Expanded(
                child: pic_tile(
                    account: accounts[i + 1],
                    height: height,
                    isATest: isATest)),
          ],
        ));
      } else {
        result.add(Row(
          children: [
            Expanded(
                child: pic_tile(
                    account: accounts[i], height: height, isATest: isATest)),
            Expanded(
                child: pic_tile(
                    account: accounts[0],
                    height: height,
                    empty: true,
                    isATest: isATest)),
          ],
        ));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: getAccountTiles(accounts, 200),
    );
  }
}

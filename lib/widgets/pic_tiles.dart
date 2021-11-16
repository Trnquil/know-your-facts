import 'package:flutter/material.dart';
import '../account.dart';
import 'pic_tile.dart';

class PicTiles extends StatelessWidget {
  List<Account> accounts;
  PicTiles({required this.accounts});

  List<Row> getAccountTiles(List<Account> accounts, int height) {
    List<Row> result = [];
    for(int i=0; i<accounts.length; i=i+2) {
      if(i+1 < accounts.length) {
        result.add(Row(
          children: [
            Expanded(child: pic_tile(account: accounts[i], height: height)),
            Expanded(child: pic_tile(account: accounts[i+1], height: height)),
          ],
        ));
      } else {
        result.add(Row(
          children: [
            Expanded(child: pic_tile(account: accounts[i], height: height)),
            Expanded(child: pic_tile(account: accounts[0], height: height, empty: true,)),
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

import 'package:know_your_facts/accountView.dart';
import 'package:know_your_facts/data_model/account.dart';

class Suggestion {
  Suggestion({
    this.entity,
    this.type = statementType.individual
});
  Account? entity;
  statementType type;

}
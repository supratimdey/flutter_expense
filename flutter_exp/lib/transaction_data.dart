import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'model/transaction.dart';

class TransactionData extends ChangeNotifier {
  final List<Transaction> _transactions = [];

  int get transactionsCount => _transactions.length;

  UnmodifiableListView<Transaction> get transactions =>
      UnmodifiableListView(_transactions);

  void addTransaction(Transaction tx) {
    _transactions.add(tx);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/transaction.dart';
import '../transaction_data.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(builder: (context, txData, child) {
      return Column(
        children:
            txData.transactions.map((tx) => TransactionCard(tx: tx)).toList(),
      );
    });
  }
}

class TransactionCard extends StatelessWidget {
  final Transaction tx;
  const TransactionCard({Key? key, required this.tx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                //color: Colors.b,
                width: 2,
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  const Icon(
                    Icons.price_change_outlined,
                    color: Colors.green,
                    size: 24,
                  ),
                  Text(
                    "\$ ${tx.amount.toString()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  DateFormat.yMMMMd().format(tx.date),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      elevation: 10,
    );
  }
}

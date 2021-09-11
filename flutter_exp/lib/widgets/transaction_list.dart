import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/transaction.dart';
import '../transaction_data.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({
  //   Key? key,
  //   required this.transactions,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions =
        Provider.of<TransactionData>(context).transactions;
    return Column(
      children: transactions.map(
        (tx) {
          return Card(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      //color: Colors.b,
                      width: 2,
                    ),
                  ),
                  // width: 80,
                  // height: 60,
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
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
                      Text(DateFormat.yMMMMd().format(tx.date),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 10,
          );
        },
      ).toList(),
    );
  }
}

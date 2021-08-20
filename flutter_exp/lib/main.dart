import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();
    transactions.add(Transaction(
        id: '1', title: 'Grocery ', amount: 20.00, date: DateTime.now()));
    transactions.add(Transaction(
        id: '2', title: 'School Fee', amount: 69.99, date: DateTime.now()));
    print('init state');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Card(
                color: Colors.amber.shade900,
                child: Center(child: const Text('CHART')),
                elevation: 10,
              ),
            ),
            Column(
              children: transactions.map(
                (tx) {
                  return Card(
                    color: Colors.red.shade50,
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
                            child: Text(
                              "\$ ${tx.amount.toString()}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}

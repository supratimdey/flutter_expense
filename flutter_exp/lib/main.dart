import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/transaction.dart';
import '/widgets/new_transaction.dart';
import 'transaction_data.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TransactionData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  // final List<Transaction> transactions = [];

  // @override
  // void initState() {
  //    super.initState();
  //   // transactions.add(Transaction(
  //   //     id: '1', title: 'Grocery ', amount: 20.00, date: DateTime.now()));
  //   // transactions.add(Transaction(
  //   //     id: '2', title: 'School Fee', amount: 69.99, date: DateTime.now()));
  //   print('init state');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
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
              NewTransaction(),
              TransactionList(), //transactions: transactions),
            ],
          ),
        ),
      ),
    );
  }
}

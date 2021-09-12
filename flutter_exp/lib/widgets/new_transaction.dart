import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exp/model/transaction.dart';
import 'package:provider/provider.dart';

import '../transaction_data.dart';

class NewTransaction extends StatelessWidget {
  /// declare focus
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _amtFocus = FocusNode();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _titleController,
            focusNode: _titleFocus,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            focusNode: _amtFocus,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d+\.?\d*'),
              )
            ],
            controller: _amtController,
          ),
          ElevatedButton(
            onPressed: () {
              final Transaction tx = Transaction(
                title: _titleController.text,
                amount: double.parse(_amtController.text),
                date: DateTime.now(),
              );
              Provider.of<TransactionData>(context, listen: false)
                  .addTransaction(tx);
              _titleFocus.unfocus();
              _titleController.clear();
              _amtFocus.unfocus();
              _amtController.clear();
            },
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}

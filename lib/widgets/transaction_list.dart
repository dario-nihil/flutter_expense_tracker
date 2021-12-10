import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        // : ListView.builder( There is a bug in Flutter with Key and ListView.builder, so I switched to code below
        //     itemBuilder: (ctx, idx) {
        //       return TransactionItem(
        //           transaction: transactions[idx],
        //           mediaQuery: mediaQuery,
        //           deleteTx: deleteTx);
        //     },
        //   itemCount: transactions.length,);
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    mediaQuery: mediaQuery,
                    deleteTx: deleteTx))
                .toList(),
          );
  }
}

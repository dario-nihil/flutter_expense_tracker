import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[idx].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[idx].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[idx].date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

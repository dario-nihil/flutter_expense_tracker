import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTite = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTite.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTite, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => submitData(),
            // onChanged: (val) {
            //   titleInput = val;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
            // onChanged: (val) {
            //   amountInput = val;
            // },
          ),
          FlatButton(
            onPressed: submitData,
            child: Text('Add Transaction'),
            textColor: Colors.purple,
          ),
        ]),
      ),
    );
  }
}

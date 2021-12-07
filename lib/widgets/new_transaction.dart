import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTite = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTite.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(enteredTite, enteredAmount);
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

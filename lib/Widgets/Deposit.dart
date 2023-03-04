import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Deposit extends StatefulWidget {
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deposit'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState != null && _formKey.currentState!.validate()) {
              final amount = _amountController.text;
              final url = Uri.parse('http://165.232.123.254:8080/api/v1/transactions/deposit');
              final headers = {'Content-Type': 'application/json'};
              final body = jsonEncode({'amount': double.parse(amount), 'walletId': '63fdc6a52541500b3ecd4ee4'});
              final response = await http.post(url, headers: headers, body: body);
              if (response.statusCode == 200) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deposit successful')));
                Navigator.pop(context);
              } else {
                final jsonResponse = jsonDecode(response.body);
                final errorMessage = jsonResponse['message'] ?? 'Deposit failed';
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
              }
            }
          },
          child: Text('Deposit'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

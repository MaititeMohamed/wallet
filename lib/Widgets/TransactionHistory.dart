import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'AllTransactionHistory.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  Future<List<Transaction>> _getTransactions() async {
    final response =
    await http.get(Uri.parse('http://165.232.123.254:8080/api/v1/transactions'));
    if (response.statusCode == 200) {
      final List<dynamic> transactionsJson = json.decode(response.body);
      return transactionsJson.map((json) => Transaction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction History",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionsListScreen(),
                    ),
                  );
                },
                child: Text(
                  "Show All",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          FutureBuilder<List<Transaction>>(
            future: _getTransactions(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Transaction>> snapshot) {
              if (snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length > 4 ? 4 : transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Transaction transaction = transactions[index];
                    IconData icon;
                    Color color;
                    if (transaction.transactionType == 'DEPOSIT') {
                      icon = Icons.arrow_circle_up;
                      color = Colors.green;
                    } else {
                      icon = Icons.arrow_circle_down;
                      color = Colors.red;
                    }
                    return ListTile(
                      leading: Icon(icon, color: color),
                      title: Text(
                        '${transaction.transactionType} - \$${transaction.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(transaction.createdAt),
                    );
                  },
                );

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

class Transaction {
  final double amount;
  final String createdAt;
  final String transactionType;

  Transaction({
    required this.amount,
    required this.createdAt,
    required this.transactionType,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      amount: json['amount'],
      createdAt: json['createdAt'],
      transactionType: json['transactionType'],
    );
  }
}

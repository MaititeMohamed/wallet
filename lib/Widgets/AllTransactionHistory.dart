
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TransactionsListScreen extends StatefulWidget {
  const TransactionsListScreen({Key? key}) : super(key: key);

  @override
  _TransactionsListScreenState createState() => _TransactionsListScreenState();
}

class Transaction {
  final int id;
  final double amount;
  final DateTime createdAt;
  final String transactionType;
  final String walletId;

  Transaction({
    required this.id,
    required this.amount,
    required this.createdAt,
    required this.transactionType,
    required this.walletId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: json['amount'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      transactionType: json['transactionType'],
      walletId: json['walletId'],
    );
  }
}

class _TransactionsListScreenState extends State<TransactionsListScreen> {
  Future<List<Transaction>>? _transactionsFuture;

  @override
  void initState() {
    super.initState();
    _transactionsFuture = _fetchTransactions();
  }

  Future<List<Transaction>> _fetchTransactions() async {
    final response = await http.get(Uri.parse(
        'http://165.232.123.254:8080/api/v1/transactions/wallet?walletId=63fdda1bc213d514b8148884'));

    if (response.statusCode == 200) {
      final List<dynamic> transactionsJson = json.decode(response.body);
      final List<Transaction> transactions =
      transactionsJson.map((json) => Transaction.fromJson(json)).toList();
      return transactions.reversed.toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _transactionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final transaction = snapshot.data![index];
                  return TransactionItem(transaction: transaction);
                },
              );
            } else {
              return Center(
                child: Text('No transactions found'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        transaction.transactionType == 'DEPOSIT'
            ? Icons.arrow_downward
            : Icons.arrow_upward,
        color: transaction.transactionType == 'DEPOSIT'
            ? Colors.green
            : Colors.red,
      ),
      title: Text(
        transaction.transactionType == 'DEPOSIT' ? 'Deposit' : 'Withdraw',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        DateFormat.yMd().add_Hms().format(
          DateTime.parse(transaction.createdAt.toString()),
        ),
      ),
      trailing: Text(
        '\$${transaction.amount.toStringAsFixed(2)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: transaction.transactionType == 'DEPOSIT'
              ? Colors.green
              : Colors.red,
        ),
      ),
    );
  }
}


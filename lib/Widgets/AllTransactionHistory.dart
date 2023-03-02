import 'package:flutter/material.dart';
class AllTransactionHistory extends StatefulWidget {
  const AllTransactionHistory({Key? key}) : super(key: key);

  @override
  _AllTransactionHistoryState createState() => _AllTransactionHistoryState();
}

class _AllTransactionHistoryState extends State<AllTransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Transaction History"),
      ),
      body: Center(
        child: Text("All Transaction History"),
      ),
    );
  }
}

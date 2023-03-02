import 'package:flutter/material.dart';

import 'Pages/Home.dart';
import 'Pages/Profile.dart';
import 'Pages/Settings.dart';
import 'Pages/Wallet.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;

  final List<Widget> _children = [    Home(),    Wallet(),    Profile(),   Settings()  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.orange
      ),
      home: Scaffold(
     /*
       appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () { /* do something */ },
          ),
          actions: <Widget>[
            IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              onPressed: () { /* do something */ },
            ),
          ],
          //title: Text('Bottom Navigation Bar Example'),
        ),
     */
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'Wallet'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
            ),
          ],
        ),
      ),
    );
  }
}









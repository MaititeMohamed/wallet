import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Color(0xff114EA5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Hello, Mohamed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '\$27,000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Your Balance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_downward),
                label: Text('Withdraw'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff114EA5),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_upward),
                label: Text('Deposit'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff114EA5),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
    SingleChildScrollView(
    child: Padding(
    padding: EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 10,
    ),
    child: Column(
    children: [
    //single Item
    Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
    width: double.infinity, // use full available width
    height: 90,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 3,
    blurRadius: 10,
    offset: Offset(0, 3),
    )
    ],
    ),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    InkWell(
    onTap: (){
    },
    child: Container(
    alignment: Alignment.center,
    child: Image.asset(
    "images/avatar.png",
    height: 100,
    width: 120, // reduce width to fit better
    ),
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Withraw ",
    style: TextStyle(

    fontSize: 22,
    fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        "- \$ 100 ",
        style: TextStyle(
          color: Colors.red,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
    ),
    SizedBox(width: 10),
    ],
    ),
    ),
    ),










    ],
    ),
    ),
    ),



    ],
    );
  }
}

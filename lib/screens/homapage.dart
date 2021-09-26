// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_aqua/screens/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  get child => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 350,
                height: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.grey[400],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 35),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Current Billssssss',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'August',
                              ),
                            ),
                            Text(
                              '10 cubic',
                            ),
                            Text(
                              '₱ 1,200.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 450,
                      height: 335,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0))),
                        color: Colors.grey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'Recent Transactions',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    indent: 16,
                                    endIndent: 16,
                                    thickness: 3,
                                    color: Colors.grey[400],
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20.0,
                                      ),
                                      child: Row(
                                        children: const <Widget>[
                                          Expanded(
                                            child: Text('August',
                                                textAlign: TextAlign.center),
                                          ),
                                          Expanded(
                                            child: Text('10 Cubic',
                                                textAlign: TextAlign.center),
                                          ),
                                          Expanded(
                                            child: Text('₱1,200.00'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    indent: 16,
                                    endIndent: 16,
                                    thickness: 3,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            Spacer(),
            IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => account()));
                }),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

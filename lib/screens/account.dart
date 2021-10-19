import 'package:flutter/material.dart';
import 'package:my_aqua/screens/homapage.dart';
import 'package:my_aqua/screens/account.dart';

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            //passing to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  radius: 50.0,
                  child: Image.asset(
                    'assets/2.png',
                  )),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                "Jett Aldine P. Melendres",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                "Account No: 0909090909",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      child: Column(
                        children: [
                          Divider(
                            thickness: 3,
                            color: Colors.grey[400],
                          ),
                          Row(
                            children: const <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Email',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text('Jetty@gmail.com',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.grey[400],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Divider(
                            thickness: 3,
                            color: Colors.grey[400],
                          ),
                          Row(
                            children: const <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Address',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text('San Bartolome',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.grey[400],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Divider(
                            thickness: 3,
                            color: Colors.grey[400],
                          ),
                          Row(
                            children: const <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Phone Number',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text('09222222222',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.grey[400],
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text("Log Out")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          FloatingActionButton(child: Icon(Icons.paid), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    return scaffold;
  }
}

import 'package:flutter/material.dart';
import 'package:my_aqua/screens/homapage.dart';
import 'package:my_aqua/screens/account.dart';

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: const <Widget>[
                              Expanded(
                                child:
                                    Text('Email', textAlign: TextAlign.start),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text('Jetty@gmail.com',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            children: const <Widget>[
                              Expanded(
                                child:
                                    Text('Email', textAlign: TextAlign.start),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text('Jetty@gmail.com',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            children: const <Widget>[
                              Expanded(
                                child:
                                    Text('Email', textAlign: TextAlign.start),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text('Jetty@gmail.com',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
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
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

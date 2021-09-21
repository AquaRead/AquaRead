import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_aqua/screens/loginpage.dart';
import 'package:my_aqua/screens/registerpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AquaRead"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 180,
                  child: Image.asset('assets/2.png', fit: BoxFit.contain),
                ),
                Text(
                  "Welcome to AquaRead",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Jetty",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ActionChip(
                    label: Text("Log Out"),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      setState(() {});
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
              ],
            ),
          ),
        ));
  }
}

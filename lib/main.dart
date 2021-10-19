import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_aqua/screens/account.dart';
import 'package:my_aqua/screens/homapage.dart';
import 'package:my_aqua/screens/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_aqua/screens/readinpage.dart';
import 'package:my_aqua/screens/splashpage.dart';
import 'package:my_aqua/screens/splashpage.dart';
import 'package:my_aqua/screens/testreadingpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO: Handle error for Firebase.initializeApp
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaRead',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: Splashscreen(),
    );
  }
}

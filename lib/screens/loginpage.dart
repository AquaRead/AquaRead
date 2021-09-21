// ignore_for_file: unnecessary_new
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_aqua/screens/homapage.dart';
import 'package:my_aqua/screens/registerpage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing Controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();

    void _doSomething() async {
      Timer(Duration(seconds: 3), () async {
        _btnController.success();
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.

          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          setState(() {});

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      });
    }

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        //validator: (){},
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        //validator: (){},
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final LoginButton = RoundedLoadingButton(
      child: Text('LogIn', style: TextStyle(color: Colors.white)),
      onPressed: _doSomething,
      controller: _btnController,
      elevation: 5,
      color: Colors.blueAccent,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset('assets/2.png', fit: BoxFit.contain),
                    ),
                    SizedBox(height: 40),
                    emailField,
                    SizedBox(height: 10),
                    passwordField,
                    SizedBox(height: 10),
                    LoginButton,
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't Have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

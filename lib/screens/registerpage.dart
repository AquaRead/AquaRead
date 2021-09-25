// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_aqua/screens/loginpage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //our form key
  final _formKey = GlobalKey<FormState>();

  var confirmPass;

  //editing Controller
  final accountNumberEditingController = new TextEditingController();
  final fullNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final reTypePasswordEditingController = new TextEditingController();

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
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Creating Account!'),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text);
          setState(() {});

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      });
    }

    User? user = FirebaseAuth.instance.currentUser;
    key:
    _formKey;

    //Account Number field
    final accountNumberField = TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateAccountNumber,
        autofocus: false,
        controller: accountNumberEditingController,
        keyboardType: TextInputType.number,
        //validator: (){},
        onSaved: (value) {
          accountNumberEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Account Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //Fullname field
    final fullNameField = TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateFullName,
        autofocus: false,
        controller: fullNameEditingController,
        keyboardType: TextInputType.name,
        //validator: (){},
        onSaved: (value) {
          fullNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Full Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //Address field
    final addressField = TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateAdressField,
        autofocus: false,
        controller: addressEditingController,
        keyboardType: TextInputType.emailAddress,
        //validator: (){},
        onSaved: (value) {
          addressEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final emailField = TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateEmail,
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        //validator: (){},
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //phone number field
    final phoneNumberField = TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validatephoneNumberField,
        autofocus: false,
        controller: phoneNumberEditingController,
        keyboardType: TextInputType.phone,
        //validator: (){},
        onSaved: (value) {
          phoneNumberEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "phone Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //Password field
    final passwordField = TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) {
          confirmPass = value;
          String pattern =
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
          RegExp regex = RegExp(pattern);
          if (value!.isEmpty) {
            return "Please Enter Password";
          } else if (!regex.hasMatch(value)) {
            return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
          } else {
            return null;
          }
        },
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        //validator: (){},
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //reTypePassword field
    final reTypePasswordField = TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) {
          if (value!.isEmpty) {
            return "Please Re-Enter New Password";
          } else if (value.length < 8) {
            return "Password must be atleast 8 characters long";
          } else if (value != confirmPass) {
            return "Password must be same as above";
          } else {
            return null;
          }
        },
        autofocus: false,
        controller: reTypePasswordEditingController,
        obscureText: true,
        //validator: (){},
        onSaved: (value) {
          reTypePasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Re-Type Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //signup button
    final signInButton = RoundedLoadingButton(
      child: Text('Register', style: TextStyle(color: Colors.white)),
      onPressed: _doSomething,
      controller: _btnController,
      elevation: 5,
      color: Colors.blueAccent,
    );

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
                      height: 180,
                      child: Image.asset('assets/1.png', fit: BoxFit.contain),
                    ),
                    accountNumberField,
                    SizedBox(height: 15),
                    fullNameField,
                    SizedBox(height: 15),
                    addressField,
                    SizedBox(height: 15),
                    emailField,
                    SizedBox(height: 15),
                    passwordField,
                    SizedBox(height: 15),
                    reTypePasswordField,
                    SizedBox(height: 15),
                    signInButton,
                    SizedBox(height: 15),
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

String? validateAccountNumber(String? formAccountNumber) {
  if (formAccountNumber == null || formAccountNumber.isEmpty) {
    return "Enter Valid Account";
  }
  return null;
}

String? validateFullName(String? formFullName) {
  if (formFullName == null || formFullName.isEmpty) {
    return "Enter Fullname";
  }
  return null;
}

String? validateAdressField(String? formAddressField) {
  if (formAddressField == null || formAddressField.isEmpty) {
    return "Enter Address";
  }
  return null;
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return "Enter Email Address";
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';
  return null;
}

String? validatephoneNumberField(String? formphoneNumberField) {
  if (formphoneNumberField == null || formphoneNumberField.isEmpty) {
    return "Enter Phone Number";
  }
  return null;
}

void showFloatingSnackbar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      "Processing Data",
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
    shape: StadiumBorder(),
    behavior: SnackBarBehavior.floating,
  );
}

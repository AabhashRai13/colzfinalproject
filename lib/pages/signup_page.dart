import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rentmandu/widgets/widgets.dart';

import '../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _key,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldform(
                      email: email,
                      hinttext: "Enter Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    PasswordField(
                      password: password,
                      hintText: "Enter Password",
                      textInputType: TextInputType.text,
                    ),
                    PasswordField(
                      password: confirmpassword,
                      hintText: "Confirm Password",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 16,

                          ),
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                        fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    MyTextButton(
                        buttonName: "SignUp",
                        onTap: () {}
                        ),
                  ],
                ),
              ))),
    );
  }
}

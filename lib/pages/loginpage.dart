import 'package:flutter/material.dart';
import 'package:rentmandu/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

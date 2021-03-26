import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentmandu/provider/currentUser.dart';
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

  void _signupUser(String email, String password, BuildContext context) async{
  CurrentUser _currentuser= Provider.of<CurrentUser>(context, listen: false);
  
  try{
    if(await _currentuser.signUpUser(email, password)){
      print("okay");
      Navigator.pop(context);
    }
  }catch(e){
    print("vayena");
    print(e);
  }
  }
  
  void showSnack(BuildContext context){
    final snackBar = SnackBar(content: Text("Password doesn't Match"));
    Scaffold.of(context).showSnackBar(snackBar);
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
          child: Form(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldform(
                      validator: (val){
                        if(val.isEmpty)
                          return "Email is Required";
                      },
                      email: email,
                      hinttext: "Enter Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    PasswordField(
                      validator: (val) {
                        if (val.isEmpty) return "password is required";
                      },
                      password: password,
                      hintText: "Enter Password",
                      textInputType: TextInputType.text,
                    ),
                    PasswordField(
                      validator: (val) {
                        if (val.isEmpty) return "Repassword is required";
                      },
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
                        onTap: () {
                          if(password.text== confirmpassword.text){
                            _signupUser(email.text,password.text,context);
                          }else{
                           
                            _key.currentState.showSnackBar(
                              SnackBar(content: Text("Password doesn't Match"),
                              duration: Duration(seconds: 3),)
                            );
                          }
                        }
                        ),
                  ],
                ),
              ))),
    );
  }
}

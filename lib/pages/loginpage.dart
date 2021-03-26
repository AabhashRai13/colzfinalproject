import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rentmandu/authorization_call/auth.dart';
import 'package:rentmandu/provider/currentUser.dart';
import 'package:rentmandu/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<CurrentUser>(context);
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Form(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Flexible(
                  child: Container(
                    child: SvgPicture.asset("assets/icons/trav.svg",
                    ),
                  ),
                ),
                
                Text("Rentmandu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),),
                TextFieldform(
                  validator: (val) {
                    if (val.isEmpty) return "Email is required";
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
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/signuppage');
                      },
                      child: Text(
                        "Register",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                MyTextButton(
                    buttonName: "Sign In", onTap: () async{
                      if(!await user.signUpUser(email.text, password.text)){
                        Navigator.pushNamed(context, "/homepage");
                      }
                }),
                SizedBox(
                  height: 30.0,
                ),
                Text("Continue with",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async{
                        if (!await user.signInWithGoogle()){
                          Navigator.pushNamed(context, "/homepage");
                        }
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        color: Colors.grey[200],
                        child: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.green,
                          size: 35,
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.grey[200],
                      child: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

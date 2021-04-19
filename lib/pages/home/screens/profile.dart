import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentmandu/provider/currentUser.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CurrentUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${provider.getname}"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Log out"),
            onPressed: (){
            provider.signOut();
            }),
      ),
    );
  }
}

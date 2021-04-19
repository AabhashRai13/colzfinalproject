import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentmandu/introscreen/introduction.dart';
import 'package:rentmandu/pages/home/home.dart';
import 'package:rentmandu/pages/loginpage.dart';
import 'package:rentmandu/provider/currentUser.dart';


class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CurrentUser.instance(),
      child: Consumer(
        builder: (context, CurrentUser user, _) {
          switch (user.status) {
            case Status.Uninitialized:
              return IntroductionScreen();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return LoginPage();
            case Status.Authenticated:
              return Home();
          }
        },
      ),
    );
  }
}

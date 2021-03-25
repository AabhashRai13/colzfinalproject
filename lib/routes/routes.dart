import 'package:flutter/material.dart';
import 'package:rentmandu/introscreen/introduction.dart';
import 'package:rentmandu/pages/signup_page.dart';
import 'package:rentmandu/widgets/my_page_route_builder.dart';
import '../pages/loginpage.dart';

class RouterApp{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MyPageRouteBuilder(screen: IntroductionScreen()).buildPageRoute();
      case '/loginpage':
        return MyPageRouteBuilder(screen: LoginPage()).buildPageRoute();
      case "/signuppage":
        return MyPageRouteBuilder(screen: SignUpPage()).buildPageRoute();
        
      default:
        return null;
    }
  }
}
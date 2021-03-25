import 'package:flutter/material.dart';

class MyPageRouteBuilder{
  final Widget screen;

  // ignore: sort_constructors_first
  MyPageRouteBuilder({ @required this.screen});
  
  // ignore: always_specify_types
  PageRouteBuilder<Widget> buildPageRoute(){
    // ignore: always_specify_types
    return PageRouteBuilder(pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (_, Animation<double> anim, __, Widget child) {
        const Offset begin = Offset(0.0, 1.0);
        final Offset end = Offset.zero;
        final Cubic curve = Curves.ease;
    
        // ignore: always_specify_types
        final Animatable<Offset> tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
    
        return SlideTransition(
          position: anim.drive(tween),
          child: child,
        );
      },
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:rentmandu/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rentmandu',
      theme: ThemeData(
          primaryColor: const Color(0xFF03A63C)
      ),
      initialRoute: "/",
    onGenerateRoute: (RouteSettings settings) => RouterApp.generateRoute(settings),
    );
  }
}

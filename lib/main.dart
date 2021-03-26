import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentmandu/provider/bottom_navigation_bar.dart';
import 'package:rentmandu/provider/currentUser.dart';
import 'package:rentmandu/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=> CurrentUser(),

        ),
        ChangeNotifierProvider.value(
          value: BottomNavigationBarProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rentmandu',
        theme: ThemeData(
            primaryColor: const Color(0xFF03A63C)
        ),
        initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) => RouterApp.generateRoute(settings),
      ),
    );
  }
}

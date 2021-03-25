import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  // ignore: always_specify_types
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(Slide(
        title: 'Rentmandu',
        description: 'Welcome to the Rentmandu',
        backgroundColor: Colors.lightGreen)
    );
    slides.add(Slide(
        title: 'Rentmandu',
        description: 'Search for the Wonderful Room at affortable price.',
        backgroundColor: Colors.lightGreen)
    );
    slides.add(Slide(
        title: 'Rentmandu',
        description: "Let's. Continue",
        backgroundColor: Colors.lightGreen)
    );
  }
  void onDonePress(){
    Navigator.pushNamed(context, '/loginpage');
  }
  
  void onSkipPress(){
    Navigator.pushNamed(context, '/loginpage');
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: onDonePress,
      onSkipPress: onSkipPress,
    );
  }
}

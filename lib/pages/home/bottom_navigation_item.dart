import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentmandu/provider/bottom_navigation_bar.dart';

class MyBottomNavigationBarItem extends StatelessWidget {
  final BottomNavigationBarProvider provider;
  final int currentScreenIndex;
  final String iconLocation;
  final String iconType;
  final String label;

  const MyBottomNavigationBarItem(
      {Key key,
      @required this.provider,
      @required this.currentScreenIndex,
      @required this.iconLocation,
      this.iconType,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 30,
      onPressed: () {
        provider.currentIndex = currentScreenIndex;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconType == "svg"
              ? SvgPicture.asset(
                  iconLocation,
                  height: 26.0,
                  color: provider.currentIndex == currentScreenIndex
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                )
              : Image.asset(
                  iconLocation,
                  height: 26.0,
                  color: provider.currentIndex == currentScreenIndex
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.0,
              color: provider.currentIndex == currentScreenIndex
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

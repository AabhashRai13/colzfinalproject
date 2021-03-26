import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentmandu/provider/bottom_navigation_bar.dart';
import 'bottom_navigation_item.dart';

class BottomAppBarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
   
    return BottomAppBar(
      child: Container(
        height: 62,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MyBottomNavigationBarItem(
                provider: provider,
                currentScreenIndex: 0,
                iconLocation: "assets/icons/shop.svg",
                iconType: 'svg',
                label: "Explore"
            ),
            MyBottomNavigationBarItem(
                provider: provider,
                currentScreenIndex: 1,
                iconLocation: "assets/icons/search.svg",
                iconType: 'svg',
                label: "Search"
            ),
            
            MyBottomNavigationBarItem(
              provider: provider,
              currentScreenIndex: 2,
              iconLocation: "assets/icons/profile.svg",
              iconType: 'svg',
              label: 'Profile',
            ),
          
          ],
        ),
      ),
    );
  }
}

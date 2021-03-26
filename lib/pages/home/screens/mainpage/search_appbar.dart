import 'package:flutter/material.dart';

class SearchAppbar extends StatefulWidget {
  @override
  _SearchAppbarState createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating:true,
     
      title: Container(
        height: 35.0,
        margin: EdgeInsets.only(right: 15.0),
        padding: EdgeInsets.only(left: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: TextField(
          onTap: () {
            FocusScope.of(context).unfocus();
            TextEditingController().clear();
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.0),
              // border: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.0),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black54,
                size: 25,
              ),
              hintText: 'Search'),
        ),
      ),

    );
  }
}

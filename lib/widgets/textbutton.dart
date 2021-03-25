import 'package:flutter/material.dart';
class MyTextButton extends StatelessWidget {
  final String buttonName;
  final Function onTap;
  
  const MyTextButton({Key key, @required this.buttonName, @required this.onTap})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      width: width / 0.5,
      child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textColor: Colors.white,
          color: Colors.greenAccent,
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onPressed: onTap),
    );
  }
}

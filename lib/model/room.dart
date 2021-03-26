import 'package:flutter/material.dart';
class Room{
  String imgUrl;
  String name;
  String description;
  int price;
  String location;
  String type;
  String number;
  Room({
    @required this.number,
   @required this.imgUrl,
    @required this.name,
   @required this.description,
  @required  this.price,
   @required this.location,
  @required  this.type,
  });
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rentmandu/model/room.dart';

class RatingProvider with ChangeNotifier{
  
  List<Room> _rooms;
  double _currentRating=3.0;
  
  get currentRating=>_currentRating;
  
  set currentRating(double rating){
  _currentRating= rating;
  notifyListeners();
  }
}
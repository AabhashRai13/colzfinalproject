import 'package:flutter/material.dart';
import 'package:rentmandu/model/room.dart';
import 'package:rentmandu/pages/home/screens/mainpage/category_search.dart';
import 'package:rentmandu/pages/home/screens/mainpage/roomcarousel.dart';
import 'search_appbar.dart';
class MainPage extends StatelessWidget {
  
  // ignore: non_constant_identifier_names, always_specify_types
  final List<Room> _RoomList=[
    Room(imgUrl: 'assets/single/single1.jpg',
        name: 'Single Room,',
        number: '9860168588',
        description: 'The Room Contains attached bathroom. It also has the facility of good water supply. ',
        price: 15000,
        location: 'Thamel Kathmandu',
        type: 'BHk'),
    
    Room(imgUrl: 'assets/bhk/bhk3.jpg',
        name: 'BHK Room,',
        number: '9823326868',
        description: 'This is the BHK System room.',
        price: 5000,
        location: 'Gongabu Kathmandu',
        type: 'Single'),
    
    Room(imgUrl: 'assets/house/house4.jpg',
        name: 'Whole House,',
        number:'9841846863',
        description: 'This is the House.',
        price: 30000,
        location: 'Thamel Kathmandu',
        type: 'House'),
    
    Room(imgUrl: 'assets/flat/flat3.jpg',
        name: 'Flat Room,',
        description: 'This is the Flat room.',
        price: 20000,
        number: '9860758596',
        location: 'Manamaiju Kathmandu',
        type: 'Flat'),
    
    Room(imgUrl: 'assets/single/single3.jpg',
        name: 'Single Room,',
        number: '9849700231',
        description: 'This is the single room.',
        price: 4500,
        location: 'Pepsicola Kathmandu',
        type: 'Single'),
    
  ];

  final List<Room> _recomendRoomList=[
  
    Room(imgUrl: 'assets/flat/flat2.jpg',
        name: 'Flat Room,',
        number: '9841845265',
        description: 'This is the Flat room.',
        price: 20000,
        location: 'Manamaiju Kathmandu',
        type: 'Flat'),
    
    Room(imgUrl: 'assets/bhk/bhk1.jpg',
        name: 'BHK Room,',
        description: 'This is the BHK System room.',
        price: 5000,
        number: '014568521',
        location: 'Gongabu Kathmandu',
        type: 'Single'),
    
    Room(imgUrl: 'assets/single/single4.jpg',
        name: 'Single Room,',
        number: '57489135',
        description: 'This is the single room.',
        price: 15000,
        location: 'Thamel Kathmandu',
        type: 'BHk'),
    
  
    Room(imgUrl: 'assets/house/house3.jpg',
        name: 'Whole House,',
        description: 'This is the House.',
        price: 30000,
        number: '98416863',
        location: 'Thamel Kathmandu',
        type: 'House'),
    
  
    Room(imgUrl: 'assets/single/single1.jpg',
        name: 'Single Room,',
        number: '9841875632',
        description: 'This is the single room.',
        price: 4500,
        location: 'Pepsicola Kathmandu',
        type: 'Single'),

  ];
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: CustomScrollView(
          // ignore: always_specify_types
          slivers: [
            SearchAppbar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CategorySearch(),
                    RoomCarousel(
                        false,
                        'Rooms For You',
                        'Find the room as you need',
                        _RoomList),
                    RoomCarousel(
                        true,
                        'Most Liked Rooms',
                        'Choose the list from these',
                        _recomendRoomList)

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

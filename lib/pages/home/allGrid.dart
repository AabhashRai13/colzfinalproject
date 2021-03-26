
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rentmandu/model/room.dart';
import 'package:rentmandu/pages/home/roomdealdetails.dart';
import 'package:rentmandu/utils/constant.dart';


class AllGrid extends StatelessWidget {
  List<Room> _RoomList=[
    Room(imgUrl: "assets/single/single1.jpg",
        name: 'Single Room,',
        number: '9860168588',
        description: 'The Room Contains attached bathroom. It also has the facility of good water supply. ',
        price: 15000,
        location: 'Thamel Kathmandu',
        type: 'BHk'),
    
    Room(imgUrl: "assets/bhk/bhk3.jpg",
        name: 'BHK Room,',
        number: '9823326868',
        description: 'This is the BHK System room.',
        price: 5000,
        location: 'Gongabu Kathmandu',
        type: 'Single'),
    
    Room(imgUrl: "assets/house/house4.jpg",
        name: 'Whole House,',
        number:'9841846863',
        description: 'This is the House.',
        price: 30000,
        location: 'Thamel Kathmandu',
        type: 'House'),
    
    Room(imgUrl: "assets/flat/flat3.jpg",
        name: 'Flat Room,',
        description: 'This is the Flat room.',
        price: 20000,
        number: '9860758596',
        location: 'Manamaiju Kathmandu',
        type: 'Flat'),
    
    Room(imgUrl: "assets/single/single3.jpg",
        name: 'Single Room,',
        number: '9849700231',
        description: 'This is the single room.',
        price: 4500,
        location: 'Pepsicola Kathmandu',
        type: 'Single'),
  
  ];
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8.0),
    child: OrientationBuilder(
      builder: (BuildContext context, Orientation orientation){
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              childAspectRatio: (orientation == Orientation.portrait)
                  ? MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1)
                  : MediaQuery.of(context).size.width / 900.0,
            ),
            itemCount: _RoomList.length,
            itemBuilder: (BuildContext context, int index){
              Room roomList= _RoomList[index];
            return Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push<MaterialPageRoute>(context, MaterialPageRoute(builder: (context) => RoomDealDetails(rooms: roomList,)));
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 175,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              roomList.imgUrl,
                                            ),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ),
  
                                    SizedBox(height: 10.0,),
                                    Text(roomList.name,overflow: TextOverflow.ellipsis,
                                      style: ktitle,),
                                    SizedBox(height: 2.5,),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.tag,
                                          size: 10.0,
                                          color: Colors.black87,
                                        ),
                                        SizedBox(width: 2.0),
                                        Flexible(
                                          child: Text(
                                            roomList.price.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: ksubTitle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2.5,),
  
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.call,
                                          size: 10.0,
                                          color: Colors.black87,
                                        ),
                                        SizedBox(width: 2.0),
                                        Flexible(
                                          child: Text(
                                            roomList.number,
                                            overflow: TextOverflow.ellipsis,
                                            style: ksubTitle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2.5,),
  
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.mapMarkedAlt,
                                          size: 10.0,
                                          color: Colors.black87,
                                        ),
                                        SizedBox(width: 2.0),
                                        Flexible(
                                          child: Text(
                                            roomList.location,
                                            overflow: TextOverflow.ellipsis,
                                            style: ksubTitle,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
            });
      },
    ),);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rentmandu/model/room.dart';
import 'package:rentmandu/pages/home/roomdealdetails.dart';
import 'package:rentmandu/pages/home/viewall.dart';
import 'package:rentmandu/utils/constant.dart';

class RoomCarousel extends StatelessWidget {
  final bool isDeal;
  final String title;
  final String subTitle;
  final List<Room> rooms;

  RoomCarousel(this.isDeal,
      @required this.title,
      @required this.subTitle,
      @required this.rooms);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.0,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(title,style: kheading,
            ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subTitle,
              style: ksubHeading,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push<MaterialPageRoute>(context, MaterialPageRoute(builder: (context) => ViewAll()));
  
              },
              child: Text('view all',
              style: TextStyle(color: Colors.black),),
            )
          ],
        ),),
        SizedBox(height: 10.0,),
        Container(
          height: 250.0,
          child: Container(
            height: 250.0,
            child: rooms.length == null ? CircularProgressIndicator():
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rooms.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                Room roomes= rooms[index];
                return RoomContainer(
                    isDeal: isDeal,
                    rooms: roomes);
              },
            ),
          ),
        )
      ],
    );
  }
}

class RoomContainer extends StatelessWidget {
  final bool isDeal;
  final Room rooms;

  const RoomContainer({Key key, @required this.isDeal, @required this.rooms}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.push<MaterialPageRoute>(context,
          MaterialPageRoute(builder: (context)=> RoomDealDetails(rooms: rooms,)));
      },
      child: Padding(padding: EdgeInsets.only(left: 8.0),
      child: Container(
          width: 205,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 175,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        image: DecorationImage(
                          image: AssetImage(rooms.imgUrl),
                          fit: BoxFit.fill,
                        )
                    ),
                  ),
                  isDeal
                  ? Positioned(
                      bottom: 5,
                      right: 5,
                      child: Card(child: Icon(Icons.thumb_up,color: Colors.lightBlue,))):Text('')
                ],
              ),
            ),
            Text(
              rooms.type,
              overflow: TextOverflow.ellipsis,
              style: ktitle,
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 10.0,
                  color: Colors.black87,
                ),
                SizedBox(width: 2.0),
                Text(
                  rooms.location,
                  style: ksubTitle,
                ),
              ],
            ),
            SizedBox(height: 2.5,),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.tag,
                  size: 10.0,
                  color: Colors.black87,
                ),
                SizedBox(width: 2.0),
                Text(
                  rooms.price.toString(),
                  style: ksubTitle,
                ),
              ],
            ),
            isDeal ? Text('Recommend for you',
            style: klightSubTitle,)
                :Text(""),
          ],
        ),
      ),),
    );
  }
}

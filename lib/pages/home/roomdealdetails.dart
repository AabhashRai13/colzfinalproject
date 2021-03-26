import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rentmandu/model/room.dart';

class RoomDealDetails extends StatefulWidget {
  final Room rooms;

  const RoomDealDetails({@required this.rooms});

  @override
  _RoomDealDetailsState createState() => _RoomDealDetailsState();
}

class _RoomDealDetailsState extends State<RoomDealDetails> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: Colors.white,
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dealHeader(context, textStyle),
              _itemDetails(context),
              _description(context),
              _info(context),
            ],
          ),
        ),
      ),
    );
  }

 

  Widget _starRating(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 1.0,
            width: 30.0,
            color: Colors.grey,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Container(
            height: 25.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Center(
              child: Text('4.0'),
            ),
          ),
          Container(
            height: 1.0,
            width: 30.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _itemDetails(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12.0),
        Text(
          widget.rooms.name,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        _starRating(context),
      ],
    );
  }

  Widget _info(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'INFO',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _infoDesc('VENDOR', 'Sujan'),
                _infoDesc('PHONE', '${widget.rooms.number}'),
                _infoDesc('LOCATION', '${widget.rooms.location}'),
                SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _infoDesc(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(subTitle),
          )
        ],
      ),
    );
  }

  Widget _description(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(widget.rooms.description),
          )
        ],
      ),
    );
  }

  Widget _dealHeader(BuildContext context, TextStyle textStyle) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Hero(
            tag: 'room-img',
            child: Image.asset(
              widget.rooms.imgUrl,
            ),
          ),
        ),
        Positioned(
            top: 30.0,
            left: 15.0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: Colors.lightGreen,
              ),
            )),
        Align(
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 24,
                    width: 30,
                    color: Colors.grey.withOpacity(0.5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 24,
                    width: 30,
                    color: Colors.grey.withOpacity(0.5),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 4.0,
          right: 4.0,
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                color: Colors.lightGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '1',
                      style: textStyle,
                    ),
                    Text(
                      '/',
                      style: textStyle,
                    ),
                    Text(
                      '1',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

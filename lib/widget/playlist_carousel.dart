import 'package:bbloginredux/model/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:bbloginredux/model/destination_model.dart';
import 'package:bbloginredux/screen/destination_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayListCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () => print('See All'),
                child:
                    Text('PlayList', style: Theme.of(context).textTheme.title),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 208,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  width: 212.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 5.0,
                        child: Container(
                          height: 90,
                          width: 208.0,
                          decoration: BoxDecoration(
                            color: Color(0x3F131a22),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F0f141b),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 8
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '19 song',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(.8),
                                      ),
                                    ),
                                    Icon(
                                      MyFlutterApp.keyboard_arrow_right,
                                      size: 22,
                                      color: Colors.grey.withOpacity(.8),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 150,
                                  width: 180.0,
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16.0,
                              bottom: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  // Row(
                                  //   children: <Widget>[
                                  //     Icon(
                                  //       FontAwesomeIcons.locationArrow,
                                  //       size: 10.0,
                                  //       color: Colors.white,
                                  //     ),
                                  //     SizedBox(width: 5.0),
                                  //     Text(
                                  //       destination.country,
                                  //       style: TextStyle(
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

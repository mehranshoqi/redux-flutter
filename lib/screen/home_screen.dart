import 'package:bbloginredux/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:bbloginredux/widget/destination_carousel.dart';
import 'package:bbloginredux/widget/hotel_carousel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List _category = [
    [FontAwesomeIcons.heart, 'favorite'],
    [FontAwesomeIcons.heart, 'favorite'],
    [FontAwesomeIcons.heart, 'favorite'],
    [FontAwesomeIcons.heart, 'favorite'],
  ];

  Widget _buildIcon(int index, String label) {
    return Column(
      children: <Widget>[
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: Color(0x0e63d7b4),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            _category[index],
            size: 25.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            // child: ListView(
            //   padding: EdgeInsets.symmetric(
            //     vertical: 30.0,
            //   ),
            //   children: <Widget>[
            //     Padding(
            //       padding: EdgeInsets.only(
            //         left: 20.0,
            //         right: 120.0,
            //       ),
            //       child: Text(
            //         'What would you like to find?',
            //         style: TextStyle(
            //           fontSize: 30.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 20.0),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: _icons
            //           .asMap()
            //           .entries
            //           .map(
            //             (MapEntry map) => _buildIcon(map.key),
            //           )
            //           .toList(),
            //     ),
            //     SizedBox(height: 20.0),
            //     DestinationCarousel(),
            //     SizedBox(height: 20.0
            //     ),
            //     HotelCarousel(),
            //   ],
            // ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Palt Music',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: null,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x00ffffff),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x2663D7B4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.people_alt,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'welcome',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Mehran Soghi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[]
                    // _category
                    //     .asMap()
                    //     .entries
                    //     .map(
                    //       (MapEntry map) => _buildIcon(map.key),
                    //     )
                    //     .toList(),
                  ),
                )
              ],
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: _currentTab,
          //   onTap: (int value) {
          //     setState(() {
          //       _currentTab = value;
          //     });
          //   },
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.search,
          //         size: 30.0,
          //       ),
          //       title: SizedBox.shrink(),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.local_pizza,
          //         size: 30.0,
          //       ),
          //       title: SizedBox.shrink(),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.people_alt_rounded,
          //         size: 30,
          //       ),
          //       title: SizedBox.shrink(),
          //     )
          //   ],
          // ),
        );
      },
    );
  }
}

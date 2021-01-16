import 'package:bbloginredux/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:bbloginredux/widget/destination_carousel.dart';
import 'package:bbloginredux/widget/hotel_carousel.dart';
import 'package:bbloginredux/model/my_flutter_app_icons.dart';
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

  Widget _buildIcon(IconData _icon, String label) {
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
            _icon,
            size: 25.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(
          height: 8,
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
                SizedBox(height: 26),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // IconButton(icon: ImageIcon(AssetImage('assets/background.png')), onPressed: null),
                      _buildIcon(
                        MyFlutterApp.music,
                        'Songs',
                      ),
                      _buildIcon(
                        Icons.ac_unit_outlined,
                        'label',
                      ),
                      _buildIcon(
                        Icons.ac_unit_outlined,
                        'label',
                      ),
                      _buildIcon(
                        Icons.ac_unit_outlined,
                        'label',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

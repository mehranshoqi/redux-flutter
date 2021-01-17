import 'package:bbloginredux/model/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:bbloginredux/model/playlist_model.dart';
import 'package:bbloginredux/screen/playlist_screen.dart';
import 'package:flutter/rendering.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xff2C364A),
        // border: Border.all(width: 0),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Color(0x100f141b),
            spreadRadius: 6,
            blurRadius: 7,
            offset: Offset(
              3,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width - 30,
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Blue Dreams',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff1f1f1),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Poboon',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              MyFlutterApp.play_arrow,
              color: Color(0xfff1f1f1),
            ),
            onPressed: null,
          )
        ],
      ),
    );
  }
}

import 'package:bbloginredux/model/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:bbloginredux/model/destination_model.dart';
import 'package:bbloginredux/screen/destination_screen.dart';
import 'package:flutter/rendering.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border.all(width: 0),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F0f141b),
            spreadRadius: 4,
            blurRadius: 9,
            offset: Offset(3, 3), // changes position of shadow
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
                  color: Colors.grey.withOpacity(.8),
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Poboon',
                style: TextStyle(
                  color: Colors.grey.withOpacity(.8),
                ),
              ),
            ],
          ),
          IconButton(icon: Icon(Icons.ac_unit_outlined), onPressed: null)
        ],
      ),
    );
  }
}

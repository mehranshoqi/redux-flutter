import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bbloginredux/route/routes.dart';

// class MakeMaterialButton extends StatefulWidget {
//   @override
//   _MakeMaterialButton createState() => _MakeMaterialButton();
// }

class MakeMaterialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) => RaisedButton(
        // minWidth: double.infinity,
        // height: 60,
        onPressed: () => Navigator.of(ctx).pushNamed(
          Routes.signup,
        ),
        color: Theme.of(ctx).primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          
          "Sign oo",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}

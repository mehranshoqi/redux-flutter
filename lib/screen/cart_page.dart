import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bbloginredux/redux/app_state.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Cart page'),
            ),
          );
        });
  }
}

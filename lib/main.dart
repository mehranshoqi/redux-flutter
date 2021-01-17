import 'package:bbloginredux/screen/player.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bbloginredux/screen/auth/signup.dart';
import 'package:bbloginredux/screen/auth/login.dart';
import 'package:bbloginredux/screen/auth/auth_page.dart';
import 'package:bbloginredux/screen/products_page.dart';
import 'package:bbloginredux/screen/home_screen.dart';
import 'package:bbloginredux/screen/cart_page.dart';
import 'package:redux/redux.dart';
import 'package:bbloginredux/redux/app_state.dart';
import 'package:bbloginredux/redux/store.dart';
import 'package:bbloginredux/route/routes.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      // await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      print('FIREBASE INITIAL FAILED!');
    }
    if (!_initialized) {
      print('FIREBASE LOADING...');
    }

    final Store<AppState> store = createStore();
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
          primaryColor: Color(0xFF6CCFF6),
          accentColor: Color(0xFF63D7B4),
          backgroundColor: Color(0xFF222E3C),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                    color: Color(0xFF63D7B4),
                    fontWeight: FontWeight.w900,
                    letterSpacing: .7),
                subhead: TextStyle(
                  fontSize: 14.2,
                  color: Color(0x9FB9E6FF),
                  fontWeight: FontWeight.w400,
                ),
              ),
        ),
        routes: {
          Routes.home: (context) => HomeScreen(),
          Routes.login: (context) => LoginPage(),
          Routes.signup: (context) => SignupPage(),
          Routes.productsView: (context) => ProductsPage(),
          Routes.cart: (context) => CartPage(),
          Routes.player: (context) => Player(),
        },
      ),
    );
  }
}

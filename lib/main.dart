import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bbloginredux/screen/auth/signup.dart';
import 'package:bbloginredux/screen/auth/login.dart';
import 'package:bbloginredux/screen/auth/auth_page.dart';
import 'package:bbloginredux/screen/products_page.dart';
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

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
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
        home: AuthPage(),
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          accentColor: Colors.yellow,
        ),
        routes: {
          Routes.login: (context) => LoginPage(),
          Routes.signup: (context) => SignupPage(),
          Routes.productsView: (context) => ProductsPage(),
          Routes.cart: (context) => CartPage(),
        },
      ),
    );
  }
}

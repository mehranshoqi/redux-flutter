import 'package:bbloginredux/redux/app_state.dart';
import 'package:bbloginredux/redux/auth/auth_action.dart';
import 'package:flutter/material.dart';
import 'package:bbloginredux/animation/FadeAnimation.dart';
import 'package:bbloginredux/route/routes.dart';
import 'package:bbloginredux/services/auth.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Text(
                            "Automatic identity verification which enables you to verify your identity",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    FadeAnimation(
                      1.4,
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/illustration.png'),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                          1.5,
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                Routes.login,
                              );
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black87,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.6,
                          Container(
                            padding: EdgeInsets.only(
                              top: 3,
                              left: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () => Navigator.of(context).pushNamed(
                                Routes.signup,
                              ),
                              color: Theme.of(context).primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        MaterialButton(
                          onPressed: () =>
                              {StoreProvider.of<AppState>(context).dispatch(
                            AnymousSigninAction(),
                          ),
                          print('inja'),
                          },
                          // onPressed: () async {
                          //   dynamic res = _auth.signInAnonymously();
                          //   if (res == null) {
                          //     print('RESPONSE IS NULL!');
                          //   } else {
                          //     print('Signed in :D');
                          //     print(res);
                          //   }
                          // },
                          child: Text(
                            'continue as Guest >',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

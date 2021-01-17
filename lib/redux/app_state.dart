import 'package:bbloginredux/redux/auth/auth_state.dart';
import 'package:bbloginredux/redux/music/music_state.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import './login/login_state.dart';
import './products/products_state.dart';

@immutable
class AppState {
  final AuthState authState;
  final LoginState loginState;
  final ProductsState productsState;
  final MusicState musicState;

  AppState({
    @required this.authState,
    @required this.loginState,
    @required this.productsState,
    @required this.musicState,
  });

  AppState copyWith({
    AuthState authState,
    LoginState loginState,
    ProductsState productsState,
    MusicState musicState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      loginState: loginState ?? this.loginState,
      productsState: productsState ?? this.productsState,
      musicState: musicState ?? this.musicState,
    );
  }

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      loginState: LoginState.initial(),
      productsState: ProductsState.initial(),
      musicState: MusicState.initial(),
    );
  }
}

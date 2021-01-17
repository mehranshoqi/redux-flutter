import 'package:bbloginredux/redux/auth/auth_state.dart';
import 'package:bbloginredux/redux/player/player_state.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import './login/login_state.dart';
import './products/products_state.dart';

@immutable
class AppState {
  final AuthState authState;
  final LoginState loginState;
  final ProductsState productsState;
  final PlayerState playerState;

  AppState({
    @required this.authState,
    @required this.loginState,
    @required this.productsState,
    @required this.playerState,
  });

  AppState copyWith({
    AuthState authState,
    LoginState loginState,
    ProductsState productsState,
    PlayerState musicState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      loginState: loginState ?? this.loginState,
      productsState: productsState ?? this.productsState,
      playerState: musicState ?? this.playerState,
    );
  }

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      loginState: LoginState.initial(),
      productsState: ProductsState.initial(),
      playerState: PlayerState.initial(),
    );
  }
}

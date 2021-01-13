import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import './login/login_state.dart';
import './products/products_state.dart';

@immutable
class AppState {
  final LoginState loginState;
  final ProductsState productsState;

  AppState({
    @required this.loginState,
    @required this.productsState,
  });

  AppState copyWith({LoginState loginState, ProductsState productsState}) {
    return AppState(
      loginState: loginState ?? this.loginState,
      productsState: productsState ?? this.productsState,
    );
  }

  factory AppState.initial() {
    return AppState(
      loginState: LoginState.initial(),
      productsState: ProductsState.initial(),
    );
  }
}

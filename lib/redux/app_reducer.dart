import 'package:bbloginredux/redux/auth/auth_reducer.dart';
import 'package:bbloginredux/redux/login/login_reducer.dart';
import 'package:bbloginredux/redux/products/products_reducer.dart';
import 'package:bbloginredux/redux/app_state.dart';

AppState rootReducer(AppState state, dynamic action) => new AppState(
      authState: authReducer(state.authState, action),
      loginState: loginReducer(state.loginState, action),
      productsState: productReducer(state.productsState, action),
    );

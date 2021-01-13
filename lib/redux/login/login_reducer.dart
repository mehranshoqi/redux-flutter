import 'package:bbloginredux/redux/login/login_action.dart';
import 'package:bbloginredux/redux/login/login_state.dart';
import 'package:bbloginredux/model/screen.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState, ValidateEmailAction>(_validateEmail),
  TypedReducer<LoginState, ValidatePasswordAction>(_validatePassword),
]);

LoginState _validateEmail(LoginState state, ValidateEmailAction action) =>
    state.copyWith(email: action.email);

LoginState _validatePassword(LoginState state, ValidatePasswordAction action) =>
    state.copyWith(password: action.password);

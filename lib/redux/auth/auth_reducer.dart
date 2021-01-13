import 'package:redux/redux.dart';
import 'package:bbloginredux/redux/auth/auth_state.dart';
import 'package:bbloginredux/redux/auth/auth_action.dart';

final authReducer = combineReducers<AuthState>(
  [
    TypedReducer<AuthState, LoadingStatusAction>(_loadingStatusReducer),
  ],
);

AuthState _loadingStatusReducer(
  AuthState state,
  LoadingStatusAction action,

) {
  return state.copyWith(
    loadingStatus: action.loadingStatus,
  );
}

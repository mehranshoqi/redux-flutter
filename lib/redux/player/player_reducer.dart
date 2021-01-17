import 'package:bbloginredux/redux/player/player_action.dart';
import 'package:bbloginredux/redux/player/player_state.dart';
import 'package:redux/redux.dart';

final playerReducer = combineReducers<PlayerState>([
  TypedReducer<PlayerState, ChangePlayStatusAction>(_changePlayStatus),
]);

PlayerState _changePlayStatus(
    PlayerState state, ChangePlayStatusAction action) {
  return state.copyWith(
    playStatus: action.playStatus,
  );
}

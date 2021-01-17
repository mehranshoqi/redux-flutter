import 'package:bbloginredux/redux/music/player/player_state.dart';
import 'package:meta/meta.dart';

@immutable
class MusicState {
  final PlayerState playerState;
  MusicState({
    this.playerState,
  });
  MusicState copyWith({
    PlayerState playerState,
  }) {
    return new MusicState(
      playerState: playerState ?? this.playerState,
    );
  }

  factory MusicState.initial() => MusicState(
        playerState: PlayerState.initial(),
      );
}

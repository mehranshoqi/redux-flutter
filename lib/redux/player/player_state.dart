import 'package:meta/meta.dart';
import 'package:bbloginredux/model/music/play_status.dart';
import 'package:bbloginredux/model/music/song_model.dart';

@immutable
class PlayerState {
  final Song song;
  final PlayStatus playStatus;
  PlayerState({
    this.song,
    this.playStatus,
  });

  PlayerState copyWith({
    Song song,
    PlayStatus playStatus,
  }) {
    return new PlayerState(
      song: song ?? this.song,
      playStatus: playStatus ?? this.playStatus,
    );
  }

  factory PlayerState.initial() => new PlayerState(
        song: Song(
          imageUrl: 'assets/images/playlistbg1.jpg',
          name: 'bahar',
          path: 'm1.mp3',
          singer: 'aref',
        ),
        playStatus: PlayStatus.pause,
      );
}

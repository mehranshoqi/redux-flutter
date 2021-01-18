import 'package:bbloginredux/model/music/play_status.dart';
import 'package:bbloginredux/model/music/song_model.dart';

class ChangePlayStatusAction {
  final PlayStatus playStatus;
  ChangePlayStatusAction(
    this.playStatus,
  );
}

class SetPlayerSongAction {
  final Song song;
  SetPlayerSongAction(
    this.song,
  );
}

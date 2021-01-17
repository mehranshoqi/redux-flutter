import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bbloginredux/model/music/play_status.dart';
import 'package:bbloginredux/model/my_flutter_app_icons.dart';
import 'package:bbloginredux/redux/app_state.dart';
import 'package:bbloginredux/redux/music/player/player_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  IconData _playSit = MyFlutterApp.play_arrow;
  bool _isPlay = false;
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget slider() {
    return Slider(
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          PlayStatus _playStatus = state.musicState.playerState.playStatus;
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.ac_unit_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: null),
                            IconButton(
                                icon: Icon(
                                  Icons.ac_unit_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: null)
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 2),
                                child: Image(
                                  height:
                                      MediaQuery.of(context).size.width - 120,
                                  width:
                                      MediaQuery.of(context).size.width - 120,
                                  image: AssetImage(
                                      'assets/images/playlistbg1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              'Blue Dream',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .4,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Poboon',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .4,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'SLIDER',
                          style: TextStyle(color: Colors.red),
                        ),
                        slider(),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: 240,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    MyFlutterApp.keyboard_arrow_left,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  iconSize: 40,
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Color(0x14000000),
                                      offset: new Offset(6.0, 10.0),
                                      blurRadius: 11.0,
                                    )
                                  ],
                                ),
                                child: IconButton(
                                    icon: Icon(
                                      _playSit,
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                    iconSize: 48,
                                    onPressed: () {
                                      if (_playStatus == PlayStatus.pause) {
                                        audioCache.play('m1.mp3');
                                        _playSit = MyFlutterApp.pause;
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(
                                          ChangePlayStatusAction(
                                              playStatus: PlayStatus.play),
                                        );
                                      } else if(_playStatus == PlayStatus.play) {
                                        advancedPlayer.pause();
                                        _playSit = MyFlutterApp.play_arrow;
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(
                                          ChangePlayStatusAction(
                                              playStatus: PlayStatus.pause),
                                        );
                                      }
                                      // if (!_isPlay) {
                                      //   setState(() {
                                      //     audioCache.play('m1.mp3');
                                      //     _playSit = MyFlutterApp.pause;
                                      //     _isPlay = true;
                                      //   });
                                      // } else {
                                      //   setState(() {
                                      //     advancedPlayer.pause();
                                      //     _playSit = MyFlutterApp.play_arrow;
                                      //     _isPlay = false;
                                      //   });
                                      // }
                                    }),
                              ),
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    MyFlutterApp.keyboard_arrow_right,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  iconSize: 40,
                                  onPressed: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 64,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

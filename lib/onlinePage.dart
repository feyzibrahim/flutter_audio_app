import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class OnlinePage extends StatefulWidget {
  @override
  _OnlinePageState createState() => _OnlinePageState();
}

class _OnlinePageState extends State<OnlinePage> {
  AudioPlayer _player;

  void dispose() {
    super.dispose();
    _player.dispose();
  }

  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          color: Colors.white,
          child: Text(
            'Play',
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

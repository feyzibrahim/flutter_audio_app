import 'package:flutter/material.dart';
import 'package:audio_app/audio/audioChooser.dart';
import 'package:firebase_admob/firebase_admob.dart';

class AudioTile extends StatefulWidget {
  final String text;
  final int count;
  final audioMan;

  AudioTile({
    @required this.text,
    @required this.count,
    @required this.audioMan,
  });

  @override
  _AudioTileState createState() => _AudioTileState();
}

class _AudioTileState extends State<AudioTile> {
  MobileAdTargetingInfo targetingInfo;

  BannerAd myBanner;

  InterstitialAd myInterstitial;

  @override
  void initState() {
    super.initState();
    targetingInfo = MobileAdTargetingInfo(
      keywords: <String>[
        'games',
        'beautiful apps',
        'movies',
        'food',
        'services'
      ],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[],
    );
    myInterstitial = InterstitialAd(
      adUnitId: 'ca-app-pub-1025319699541723/1141891743',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
    myInterstitial.load();
  }

  void _showad() {
    myInterstitial
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        splashColor: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        onPressed: () {
          _showad();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AudioChooser(
                title: widget.text,
                audioChoosed: widget.audioMan,
              ),
            ),
          );
        },
      ),
    );
  }
}

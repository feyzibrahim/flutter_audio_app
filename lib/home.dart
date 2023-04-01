import 'package:flutter/material.dart';
import 'package:audio_app/audio/audio.dart';
import 'package:audio_app/modals/audioTile.dart';
import 'package:audio_app/modals/customAppBar.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-1025319699541723/8873860349',
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
          child: ListView(
            children: <Widget>[
              AudioTile(
                text: 'Film',
                count: 50,
                audioMan: audioLibraryList.audiolist,
              ),
              AudioTile(
                text: 'Non-Film',
                count: 44,
                audioMan: audioLibraryList.audioDailogue,
              ),
              AudioTile(
                text: 'Beeran',
                count: 10,
                audioMan: audioLibraryList.beeran,
              ),
              AudioTile(
                text: 'BGM',
                count: 9,
                audioMan: audioLibraryList.bgm,
              ),
              AudioTile(
                text: 'Mass dailogue with bgm',
                count: 14,
                audioMan: audioLibraryList.massAudio,
              ),
              AudioTile(
                text: 'Music',
                count: 10,
                audioMan: audioLibraryList.music,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class AudioPlay extends StatefulWidget {
  final String audioTitle;
  final String audioLoc;
  final String audioSub;

  AudioPlay({
    @required this.audioTitle,
    @required this.audioLoc,
    @required this.audioSub,
  });

  @override
  _AudioPlayState createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {
  AudioPlayer _player;

  void dispose() {
    super.dispose();
    _player.dispose();
  }

  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setAsset(widget.audioLoc);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: StreamBuilder<SequenceState>(
          stream: _player.sequenceStateStream,
          builder: (context, snapshot) {
            final state = snapshot.data;
            _player.play();
            if (state?.sequence?.isEmpty ?? true) return SizedBox();
            return Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/icon/logo.png",
                          width: 350.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        widget.audioSub,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.audioTitle,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    color: Colors.red,
                    padding: EdgeInsets.only(top: 20.0, bottom: 70.0),
                    onPressed: () => _shareFile(),
                    splashColor: Colors.redAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 50.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _shareFile() async {
    try {
      final ByteData bytes = await rootBundle.load(widget.audioLoc);
      await WcFlutterShare.share(
          sharePopupTitle: 'Share Audio',
          fileName: '${widget.audioTitle}.mp3',
          mimeType: 'audio/mp3',
          bytesOfFile: bytes.buffer.asUint8List());
    } catch (e) {
      print('error: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audio_app/audio/audio.dart';
import 'package:audio_app/audio/audioPlay.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class AudioChooser extends StatefulWidget {
  final String title;
  final audioChoosed;

  AudioChooser({
    @required this.title,
    @required this.audioChoosed,
  });

  @override
  _AudioChooserState createState() => _AudioChooserState();
}

class _AudioChooserState extends State<AudioChooser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 0.0,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(bottom: 80.0),
        itemCount: widget.audioChoosed.length,
        itemBuilder: (BuildContext context, int index) {
          final AudioLibrary audioLibrary = widget.audioChoosed[index];
          return ListTile(
            title: Text(
              '${audioLibrary.title}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            subtitle: Text(
              audioLibrary.subTitle,
              style: TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              iconSize: 20.0,
              onPressed: () => _shareFile(audioLibrary.audioLoc),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AudioPlay(
                    audioTitle: audioLibrary.title,
                    audioLoc: audioLibrary.audioLoc,
                    audioSub: audioLibrary.subTitle,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _shareFile(var loc) async {
    try {
      final ByteData bytes = await rootBundle.load(loc);
      await WcFlutterShare.share(
          sharePopupTitle: 'Share Audio',
          fileName: '${widget.title}.mp3',
          mimeType: 'audio/mp3',
          bytesOfFile: bytes.buffer.asUint8List());
    } catch (e) {
      print('error: $e');
    }
  }
}

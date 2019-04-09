import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MusicPlayer musicPlayer;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Initializing the Music Player and adding a single [PlaylistItem]
  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
    musicPlayer.setPlaylist([
      PlaylistItem(
        trackName: 'Sample',
        albumName: 'Sample Album',
        artistName: 'Sample Artist',
        url: 'https://goo.gl/5RQjTQ',
        coverUrl: 'https://goo.gl/Wd1yPP',
        duration: Duration(seconds: 255),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Music Player example app'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () => musicPlayer.play(0),
            child: Text('Play'),
          ),
        ),
      ),
    );
  }
}

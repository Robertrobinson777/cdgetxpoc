import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDialog1 extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isLoop;

  VideoDialog1({@required this.isLoop, @required this.videoPlayerController});

  @override
  _VideoDialog1State createState() => _VideoDialog1State();
}

class _VideoDialog1State extends State<VideoDialog1> {
  ChewieController chewieController;
  int nightyduration;
  int fullduration;
  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      allowFullScreen: true,
      looping: widget.isLoop,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
    chewieController.addListener(() {
      chewieController.videoPlayerController.value.position.inSeconds;
      chewieController.videoPlayerController.value.duration.inSeconds;
      nightyduration =
          (.9 * chewieController.videoPlayerController.value.duration.inSeconds)
              .round();
      if (nightyduration <=
          chewieController.videoPlayerController.value.position.inSeconds) {
        print('90');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}

class Videodisplay extends StatefulWidget {
  final String videourl;

  Videodisplay({@required this.videourl});
  @override
  _VideodisplayState createState() => _VideodisplayState();
}

class _VideodisplayState extends State<Videodisplay> {
  @override
  Widget build(BuildContext context) {
    return VideoDialog1(
      isLoop: true,
      videoPlayerController: VideoPlayerController.network(widget.videourl),
    );
  }
}

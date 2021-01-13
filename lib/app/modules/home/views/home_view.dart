import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxconfig/app/common/videoplayer.dart';
import 'package:getxconfig/app/modules/home/controllers/home_controller.dart';
import 'package:video_player/video_player.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(padding: const EdgeInsets.only(top: 20.0)),
              const Text('With remote mp4'),
              Container(
                padding: const EdgeInsets.all(20),
                child: GetBuilder<HomeController>(
                    init: HomeController(),
                    /* global: false, */
                    builder: (c) {
                      return AspectRatio(
                        aspectRatio:
                            controller.videocontroller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(controller.videocontroller),
                            ClosedCaption(
                                text: controller
                                    .videocontroller.value.caption.text),
                            _ControlsOverlay(
                                controller: controller.videocontroller),
                            VideoProgressIndicator(controller.videocontroller,
                                allowScrubbing: true),
                            Text(controller.count.toString()),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key key, this.controller}) : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VidController extends GetxController {
  var count = 0.obs;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  int nightyduration;
  int fullduration;
  var one = Get.arguments;
  var url;
  var loop;
  // Future<ClosedCaptionFile> _loadCaptions() async {
  //   final String fileContents = await DefaultAssetBundle.of(context)
  //       .loadString('assets/bumble_bee_captions.srt');
  //   return SubRipCaptionFile(fileContents);
  // }
  @override
  void onInit() {
    url = one[0];
    loop = one[1];
    // videocontroller = VideoPlayerController.network(
    //   url,
    //   // closedCaptionFile: _loadCaptions(),
    //   videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    // );

    // videocontroller.addListener(() {
    //   count = count++;
    //   update();

    //   // setState(() {});
    // });
    // videocontroller.setLooping(true);
    // videocontroller.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      allowFullScreen: true,
      looping: false,
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
  }

  @override
  void onReady() {}
  @override
  void onClose() {
    videoPlayerController.dispose();
  }

  void increment() => count.value++;
}

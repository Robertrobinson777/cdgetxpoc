import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  VideoPlayerController videocontroller;
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
    videocontroller = VideoPlayerController.network(
      url,
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    videocontroller.addListener(() {
      count = count++;
      update();

      // setState(() {});
    });
    // print(videocontroller.value.duration.inSeconds);
    videocontroller.setLooping(true);
    videocontroller.initialize();
  }

  @override
  void onReady() {}
  @override
  void onClose() {
    videocontroller.dispose();
  }

  void increment() => count.value++;
}

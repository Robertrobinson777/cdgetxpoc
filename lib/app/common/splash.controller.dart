import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  //TODO: Implement LoginController
  VideoPlayerController videocontroller;

  final count = 0.obs;
  @override
  void onInit() {
    videocontroller = VideoPlayerController.network(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    videocontroller.addListener(() {
      update();
    });
    videocontroller.setLooping(true);
    videocontroller.initialize();
    videocontroller.play();
    Future.delayed(const Duration(seconds: 10), () {
      // videocontroller.dispose();
      Get.offAndToNamed('/login');
    });
  }

  @override
  void onReady() {}
  @override
  void onClose() {
    try {
      Future.delayed(Duration.zero, () {
        if (videocontroller != null) {
          videocontroller..dispose();
          videocontroller = null;
        }
      });
    } catch (error) {
      print(error);
    }
  }

  void increment() => count.value++;
}

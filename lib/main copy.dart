// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:video_player/video_player.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String vidname;
  VideoPlayerController videocontroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Web'),
      ),
      body: Container(
          height: 51.0,
          child: OutlineButton(
            onPressed: () async {
              pickImage();
            },
            borderSide: BorderSide(
                // color: darkMode ? VC_TEXT_COLOR : VC_TEXT_COLOR_BLACK,
                width: 2.0),
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            // color: darkMode ? VC_TEXT_COLOR : VC_TEXT_COLOR_BLACK,
            // textColor: darkMode ? VC_TEXT_COLOR : VC_TEXT_COLOR_BLACK,
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Text(
                    "Upload File".toUpperCase(),
                  )
                ])),
          )),
    );
  }

  pickImage() async {
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'video/*';

    input.onChange.listen((e) async {
      if (input.files.isEmpty) return;
      vidname = input.files[0].name;
      print(input.files[0].size);
      Get.snackbar('Video Size', '${input.files[0].size.toString()}');
      videocontroller = VideoPlayerController.network(
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
      videocontroller.initialize();
      videocontroller.addListener(() {
        print(videocontroller.value.duration.inSeconds.toString());
      });

      // setState(() => _uploadedVideo = input.files[0]);
      // var url = await uploadImageFile(_uploadedVideo, imageName: _videoName);
      // uploadRecordformData['video_url'] = url.toString();
    });
    input.click();
  }
}

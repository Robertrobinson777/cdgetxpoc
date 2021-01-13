import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxconfig/app/common/videogetcont.dart';

class VideoDialog extends StatelessWidget {
  final String videourl;

  VideoDialog({@required this.videourl});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VidController>(
      init: VidController(),
      /* global: false, */
      builder: (c) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chewie(
              controller: c.chewieController,
            ),
          ),
        );
      },
    );
  }
}

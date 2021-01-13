import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getxconfig/app/common/splash.controller.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(60, 32, 189, 0.91),
          Color.fromRGBO(60, 38, 223, 0.71)
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Stack(
          children: [
            Positioned(
                top: Get.size.height * 0.3,
                left: Get.size.width * 0.00,
                child: Container(
                  height: Get.size.height * 0.25,
                  width: Get.size.width * 0.45,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Color.fromRGBO(52, 64, 245, 1),
                          Color.fromRGBO(44, 130, 177, 1)
                        ],
                        radius: 0.7,
                      ),
                      shape: BoxShape.circle),
                )),
            Positioned(
                top: Get.size.height * 0.50,
                right: Get.size.width * 0.00,
                child: Container(
                  height: Get.size.height * 0.25,
                  width: Get.size.width * 0.45,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Colors.red, Colors.pink.withOpacity(0.5)],
                        radius: 0.7,
                      ),
                      shape: BoxShape.circle),
                )),
            GetBuilder<SplashController>(
                init: SplashController(),
                /* global: false, */
                builder: (c) {
                  return Opacity(
                      opacity: 0.0,
                      child: VideoPlayer(controller.videocontroller));
                }),
          ],
        ),
      ),
    );
  }
}

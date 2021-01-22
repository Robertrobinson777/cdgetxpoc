import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxconfig/app/common/videoplayer%20copy.dart';

import 'package:getxconfig/app/modules/login/controllers/login_controller.dart';
import 'package:getxconfig/app/enum/sign_enum.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromRGBO(60, 32, 189, 0.91),
          const Color.fromRGBO(60, 38, 223, 0.71)
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        height: Get.size.height * 0.5,
                        width: Get.size.width * 0.85,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.2),
                                  Colors.white.withOpacity(0.05)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.08)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                              TextFormField(
                                controller: controller.emailController,
                                decoration: InputDecoration(hintText: "Email"),
                              ),
                              TextField(
                                controller: controller.passwordController,
                                decoration:
                                    InputDecoration(hintText: "Password"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(8),
                                      color: Colors.blue,
                                      onPressed: () {
                                        controller.handleSignIn(
                                            SignInType.EMAIL_PASSWORD);
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    FlatButton(
                                      padding: EdgeInsets.all(8),
                                      color: Colors.primaries[0],
                                      onPressed: () {
                                        controller
                                            .handleSignIn(SignInType.GOOGLE);
                                      },
                                      child: Text(
                                        "SignIn with Google",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/register");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("No account ? Register Here!"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: GestureDetector(
                          onTap: () {
                            Get.dialog(Container(
                              child: Videodisplay(
                                videourl:
                                    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                              ),
                            ));
                          },
                          child: Container(
                            height: Get.size.height * 0.1,
                            width: Get.size.width * 0.85,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.white.withOpacity(0.05)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.08)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Play Video',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('home', arguments: [
                            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                            false
                          ]);
                        },
                        child: Container(
                          height: Get.size.height * 0.1,
                          width: Get.size.width * 0.85,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.2),
                                    Colors.white.withOpacity(0.05)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.08)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Go to home',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

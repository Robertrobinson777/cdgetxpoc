import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxconfig/app/services/auth.services.dart';
import 'package:getxconfig/app/enum/sign_enum.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  RxBool isLogged = false.obs;
  TextEditingController emailController;
  TextEditingController passwordController;
  AuthService _authService;
  Rx<User> user = Rx<User>();

  LoginController() {
    _authService = AuthService();
  }

  @override
  Future<void> onInit() async {
    ever(isLogged, handleAuthChanged);
    user.value = await _authService.getCurrentUser();
    isLogged.value = user.value != null;
    _authService.onAuthChanged().listen((event) {
      isLogged.value = event != null;
      user.value = event;
    });
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  handleAuthChanged(user) {
    if (user == null || user == false) {
      print(user);
      Get.toNamed("/login");
    } else {
      Get.offAllNamed("/dashboard");
    }
  }

  handleSignIn(SignInType type) async {
    if (type == SignInType.EMAIL_PASSWORD) {
      if (emailController.text == "" || passwordController.text == "") {
        Get.snackbar(
          "Error",
          "Empty email or password",
        );
        return;
      }
    }
    Get.snackbar("Signing In", "Loading",
        showProgressIndicator: true,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(minutes: 2));
    try {
      if (type == SignInType.EMAIL_PASSWORD) {
        await _authService.signInWithEmailAndPassword(
            emailController.text.trim(), passwordController.text.trim());
        emailController.clear();
        passwordController.clear();
      }
      if (type == SignInType.GOOGLE) {
        await _authService.signInWithGoogle();
      }
    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "Error", middleText: e.message, actions: [
        FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Close"),
        ),
      ]);
      print(e);
    }
  }

  handleSignUp() async {
    if (emailController.text == "" || passwordController.text == "") {
      Get.snackbar(
        "Error",
        "Empty email or password",
      );
      return;
    }

    Get.snackbar("Signing Up", "Loading",
        showProgressIndicator: true,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(minutes: 2));
    try {
      await _authService.signUp(
          emailController.text.trim(), passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "Error", middleText: e.message, actions: [
        FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Close"),
        ),
      ]);
      print(e);
    }
  }

  handleSignOut() {
    _authService.signOut();
    Get.offAllNamed("/");
  }

  @override
  void onReady() {}
  @override
  void onClose() {}
  void increment() => count.value++;
}

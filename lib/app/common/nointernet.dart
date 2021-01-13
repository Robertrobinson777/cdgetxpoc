import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxconfig/app/common/smilecontroller.dart';

class NoInternet extends StatefulWidget {
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  SmileyController _smileyController = SmileyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.size.height / 2,
            width: Get.size.width,
            child: FlareActor("assets/sadsmile.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                controller: _smileyController,
                animation: "blink"),
          ),
          Text('No Internet'),
        ],
      ),
    );
  }
}

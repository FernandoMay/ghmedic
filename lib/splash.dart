import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ghmedic/login.dart';
import 'package:ghmedic/utils.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 0, milliseconds: 618, microseconds: 33),
        onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: -160,
            right: -120,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(160))),
            ),
          ),
          Positioned(
            bottom: -170,
            right: 50,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.all(Radius.circular(160))),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Image.asset(
                "lib/assets/ghmedic.png",
                height: 64,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

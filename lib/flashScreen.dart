import 'dart:async';

import 'package:flutter/material.dart';

import 'SignIn/signUpScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animated = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
    deiviceIdSet();
    check();
  }

  void deiviceIdSet() async {}

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animated = true;
    });
  }

  Future<void> check() async {
    Timer(
      Duration(seconds: 2),
          () => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => RegistrationScreen()),
            (Route<dynamic> route) => true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double imageHeight = 200;
    double imageWidth = 200;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo/splash_bg.png"), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                top: animated ? (deviceHeight / 2) - (imageHeight / 2) : -80,
                left: animated ? (deviceWidth / 2) - (imageWidth / 2) : -80,
                duration: const Duration(milliseconds: 1600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/images.png", height: imageHeight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

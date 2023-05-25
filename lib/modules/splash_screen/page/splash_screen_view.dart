import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  bool isVisibleLogo = false;

  _SplashScreenViewState() {
    Timer(const Duration(milliseconds: 250), () {
      setState(() {
        isVisibleLogo = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/backgrounds/splash_screen_background.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          AnimatedOpacity(
            opacity: isVisibleLogo ? 1.0 : 0,
            duration: const Duration(milliseconds: 2000),
            onEnd: () async {
              if (SecureStorage.getAccessToken().toString().isNotEmpty == true) {
                Navigator.pushNamed(context, routeHome);
              } else {
                Navigator.pushNamed(context, routeLogin);
              }
            },
            child: Center(
              child: Text(
                "PT. IMP",
                style: textFull(color: neutral30, isBold: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

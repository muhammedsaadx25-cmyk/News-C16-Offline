import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_offline/core/assets_manager.dart';
import 'package:news_app_offline/core/routes_manager/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(ImageAssets.newLogo),
              Spacer(),
              Image.asset(ImageAssets.newsBranding),

            ],
          ),
        ),
      ),
    );
  }
}

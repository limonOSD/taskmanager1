import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/state_holder.dart/splash_screen_controller.dart';

import '../widget/body_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<SplashScreenController>().goToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackGround(
          child: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          width: 100,
        ),
      )),
    );
  }
}

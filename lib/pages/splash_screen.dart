import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_booking/components/app_text_style.dart';
import 'package:movie_booking/pages/home_screen.dart';
import 'package:movie_booking/pages/login_screen.dart';
import 'package:movie_booking/pages/main_screen.dart';
import 'package:movie_booking/utils/gradient_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../app.dart';
import '../components/colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String uid = dataStorages.read('userid');

class _SplashScreenState extends State<SplashScreen> {
  static final dataStorage = GetStorage();

  @override
  void initState() {
    super.initState();

    startTime();
  }

  startTime() async {
    return Timer(
      const Duration(seconds: 7),
      () {
       navigationPage();
      },
    );
  }

  void navigationPage() async {
    if ( dataStorage.read('access_id') == "" || dataStorage.read('access_id') == null ) {
      Get.offAll(() => LoginScreen(), transition: Transition.rightToLeft);
    } else {
      Get.offAll(()=> HomeScreen(), transition: Transition.rightToLeft);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: primaryWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset('assets/jsons/myMovieAppLogo.json'),
            ),
            Text(
              "Movie\nBooking",
              style: AppTextStyle.normalBold32.copyWith(
                foreground: Paint()..shader = linearGradientText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

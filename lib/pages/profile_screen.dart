import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_booking/app.dart';
import 'package:movie_booking/components/colors.dart';
import 'package:movie_booking/pages/login_screen.dart';
import 'package:get/get.dart';

import '../components/app_text_style.dart';
import '../utils/gradient_text.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text(
          "Profile",
          style: AppTextStyle.normalBold28.copyWith(
            foreground: Paint()..shader = linearGradientText,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(onTap: () async{
          await dataStorages.erase();
          final FirebaseAuth auth = FirebaseAuth.instance;
            await auth.signOut();
            Get.offAll(()=> LoginScreen());
        },child: Text("Profile")),
      ),
    );
  }
}
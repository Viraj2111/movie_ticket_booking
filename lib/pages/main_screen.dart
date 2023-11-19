import 'package:flutter/material.dart';
import 'package:movie_booking/components/app_text_style.dart';
import 'package:movie_booking/controllers/main_screen_controller.dart';
import 'package:movie_booking/pages/home_screen.dart';
import 'package:movie_booking/pages/profile_screen.dart';

import '../components/colors.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  MainScreenController mainScreenController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        // fit: StackFit.,
        children: [
          Obx(() => [
                 HomeScreen(),
                const ProfileScreen()
              ][mainScreenController.selectedIndex.value]),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Obx(
                () => CustomNavigationBar(
                  // key: sharedfolderkey,
                  strokeColor: Colors.transparent,
                  isFloating: true,
                  borderRadius: const Radius.circular(20),
                  iconSize: 25.0,
                  selectedColor: primaryBlack,
                  unSelectedColor: const Color(0xffA2A2A2),
                  backgroundColor:Color(0xff6320EE),
                  items: [
                    CustomNavigationBarItem(
                      selectedIcon: const Padding(
                          padding:  EdgeInsets.all(3.0),
                          child: Icon(Icons.ac_unit_sharp, color: primaryWhite,)),
                      icon:  Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(Icons.ac_unit_sharp, color: primaryWhite.withOpacity(0.8),),),
                      title: Text(
                        "Home",
                        style: AppTextStyle.normalBold14.copyWith(
                            color: primaryWhite.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      selectedTitle: Text(
                        "Home",
                        style: AppTextStyle.normalBold14.copyWith(
                            color: primaryWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    CustomNavigationBarItem(
                        selectedIcon: const Padding(
                            padding:  EdgeInsets.all(3.0),
                            child: Icon(Icons.ac_unit_sharp, color: primaryWhite,)),
                        icon:  Padding(
                            padding:  const EdgeInsets.all(3.0),
                            child: Icon(Icons.ac_unit_sharp, color: primaryWhite.withOpacity(0.5),),),
                        title: Text(
                          "Profile",
                        style: AppTextStyle.normalBold14.copyWith(
                            color: primaryWhite.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        ),
                        selectedTitle: Text(
                          "Profile",
                          style: AppTextStyle.normalBold14.copyWith(
                            color: primaryWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        ),),
                  
                  ],
                  currentIndex: mainScreenController.selectedIndex.value,
                  onTap: mainScreenController.onItemTapped,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

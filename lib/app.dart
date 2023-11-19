import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_booking/pages/splash_screen.dart';

import 'components/colors.dart';

final dataStorages = GetStorage();

class MovieTicketApp extends StatefulWidget {
  const MovieTicketApp({Key? key}) : super(key: key);

  @override
  _MovieTicketAppState createState() => _MovieTicketAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _MovieTicketAppState extends State<MovieTicketApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Erixie',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: appBackgroundColor,
            // scaffoldBackgroundColor: primaryBlack,
          
            fontFamily: 'Urbanist',
            hintColor: primaryWhite,
            // primaryColor: primaryWhite,
            iconTheme: const IconThemeData(color: primaryWhite, size: 24),
            // appBarTheme: const AppBarTheme(
            //   elevation: 1,
            //   // ignore: deprecated_member_use
            //   textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
            //   backgroundColor: primaryWhite,
            //   foregroundColor: primaryWhite,
            //   centerTitle: true,
            // )
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}

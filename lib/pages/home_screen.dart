import 'package:flutter/material.dart';
import 'package:movie_booking/components/animatedWidget/fade.dart';
import 'package:movie_booking/components/colors.dart';
import 'package:movie_booking/components/image/image_widget.dart';
import 'package:movie_booking/components/static_decoration.dart';
import 'package:movie_booking/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:movie_booking/pages/seatbooking_screen.dart';
import 'package:movie_booking/widget/text_widgets/cardtext_widget.dart';

import '../components/animatedWidget/slideup.dart';
import '../components/app_text_style.dart';
import '../utils/gradient_text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  homeController. getMovieList();
    homeController. getUserData();
  }

  @override
  Widget build(BuildContext context) {
    print(homeController.len);
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        actions: [
          GestureDetector(
            onTap: () {
              homeController.logOut();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.exit_to_app_rounded,
                color: Color(0xff6320EE),
              ),
            ),
          )
        ],
        title: Text(
          "MOVIE BOOKING",
          style: AppTextStyle.normalBold28.copyWith(
            foreground: Paint()..shader = linearGradientText,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              height15,
              OpacityTween(
                child: SlideUpTween(
                  begin: const Offset(100, 0),
                  child: Text(
                    "Top 3 Movies",
                    style: AppTextStyle.normalBold14.copyWith(
                      foreground: Paint()..shader = linearGradientText,
                    ),
                  ),
                ),
              ),
              height10,
              SizedBox(
                height: Get.height * 0.2,
                child: Obx(
                  () => OpacityTween(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return OpacityTween(
                          child: SlideUpTween(
                            begin: const Offset(200, 0),
                            duration: const Duration(milliseconds: 800),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SlideUpTween(
                                begin: Offset(
                                    index == 0
                                        ? 200
                                        : index == 1
                                            ? 300
                                            : 400,
                                    0),
                                child: Container(
                                  height: 100,
                                  
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: NetworkImageWidget(
                                    imageUrl: homeController.movieList[index]
                                        ["image"],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.movieList.take(3).length,
                    ),
                  ),
                ),
              ),
              height10,
              OpacityTween(
                child: SlideUpTween(
                  begin: const Offset(100, 0),
                  child: Text(
                    "Explore Other Movies",
                    style: AppTextStyle.normalBold14.copyWith(
                      foreground: Paint()..shader = linearGradientText,
                    ),
                  ),
                ),
              ),
              height10,
              OpacityTween(
                child: SizedBox(
                  height: Get.height * 0.58,
                  child: Obx(
                    () => ListView.builder(
                      itemBuilder: (context, index) {
                        return SlideUpTween(
                          begin: Offset(
                              index == 0
                                  ? 200
                                  : index == 1
                                      ? 300
                                      : 400,
                              0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            height: Get.height * 0.3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    homeController.movieList[index]["imageS"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        primaryBlack.withOpacity(0.0),
                                        primaryBlack
                                      ],
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, bottom: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              homeController.movieList[index]
                                                  ["name"],
                                              style: AppTextStyle.normalBold14,
                                            ),
                                            height05,
                                            CardTextWidget(
                                                name: homeController
                                                        .movieList[index]
                                                    ["duration"],
                                                iconName: Icons.timer_outlined),
                                            height05,
                                            CardTextWidget(
                                                name: homeController
                                                    .movieList[index]["imdb"]
                                                    .toString(),
                                                iconName: Icons.star_border),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () => SeatBookingScreen(
                                                    movieInd: index,
                                                  ),
                                              transition:
                                                  Transition.rightToLeft);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xffC99EE6),
                                            gradient: const LinearGradient(
                                                colors: <Color>[
                                                  Color(0xff251977),
                                                  Color(0xff6320EE)
                                                ],
                                                end: Alignment.topRight,
                                                begin: Alignment.topLeft),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Text(
                                              "Select Seats",
                                              style: AppTextStyle.normalBold12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: homeController.movieList.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

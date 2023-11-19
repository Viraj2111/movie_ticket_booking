import 'package:flutter/material.dart';
import 'package:movie_booking/controllers/home_controller.dart';
import 'package:movie_booking/widget/scroll_widget/scroll_class.dart';
import 'package:get/get.dart';

import '../../components/app_text_style.dart';
import '../../components/colors.dart';
import '../../components/image/image_widget.dart';
import '../../components/static_decoration.dart';
import '../text_widgets/cardtext_widget.dart';

class header extends SliverPersistentHeaderDelegate {
  String image;

  String movieDescription;

  String movieName;
  String imdb;
  String price;
  header(
      {required this.image,
      required this.price,
      required this.movieName,
      required this.movieDescription,
      required this.imdb});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    ForTime.after(10, () {
      final homeController = Get.put(HomeController());
      homeController.shrinkprogress.value = (shrinkOffset / maxExtent);
    }, true);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Stack(
            children: [
              //! BACKGROUND IMAGE
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryWhite,
                      image: DecorationImage(
                        opacity: (minExtent / shrinkOffset).clamp(0, 1) < 0.42
                            ? 0
                            : (minExtent / shrinkOffset).clamp(0, 1),
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: (minExtent / shrinkOffset).clamp(0, 1) > 0.80
                            ? [primaryBlack.withOpacity(0.0), primaryBlack]
                            : [primaryWhite, primaryWhite],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),

              AnimatedAlign(
                duration: const Duration(milliseconds: 100),
                alignment: Alignment.lerp(
                    const Alignment(-0.89, 0.2),
                    const Alignment(-0.89, -0.0),
                    (shrinkOffset / maxExtent) > .80
                        ? -0
                        : (shrinkOffset / maxExtent))!,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(top: 30),
                      height: 45,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(colors: <Color>[
                          Color(0xff251977),
                          Color(0xff6320EE)
                        ], end: Alignment.topRight, begin: Alignment.topLeft),
                        color: primaryWhite.withOpacity(
                            (minExtent / shrinkOffset).clamp(0, 1) > 0.80
                                ? 0
                                : 1),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: primaryWhite.withOpacity(
                              (minExtent / shrinkOffset).clamp(0, 1) > 0.80
                                  ? 0
                                  : 1))),
                ),
              ),

              AnimatedAlign(
                duration: const Duration(milliseconds: 100),
                alignment: Alignment.lerp(
                    const Alignment(-0.89, 0.30),
                    const Alignment(0.89, 0.0),
                    (shrinkOffset / maxExtent) > .55
                        ? 0.5
                        : (shrinkOffset / maxExtent))!,
                child: GestureDetector(
                  onTap: () {},
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: (minExtent / shrinkOffset).clamp(0, 1) > 0.80
                              ? 10
                              : 0),
                      width: (minExtent / shrinkOffset).clamp(0, 1) > 0.80
                          ? Get.width
                          : Get.width * 0.5,
                      child: Text(
                        movieName,
                        textAlign: (minExtent / shrinkOffset).clamp(0, 1) > 0.80
                            ? null
                            : TextAlign.center,
                        style: AppTextStyle.normalSemiBold22.copyWith(
                            fontSize: 27,
                            fontWeight: FontWeight.w400,
                            color: (minExtent / shrinkOffset).clamp(0, 1) > 0.80
                                ? primaryWhite
                                : Color(0xff6320EE)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 290,
                left: 11,
                child: Container(
                  width: Get.width - 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          movieDescription,
                          style: AppTextStyle.normalRegular15.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: primaryWhite),
                        ),
                      ),
                      height05,
                      CardTextWidget(
                          name: imdb.toString(), iconName: Icons.star_border),
                      height05,
                      CardTextWidget(
                          name: "${price.toString()} /~",
                          iconName: Icons.attach_money_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 400;

  @override
  // TODO: implement minExtent
  double get minExtent => 110;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

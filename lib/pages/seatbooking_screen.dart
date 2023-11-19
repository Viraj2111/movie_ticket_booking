import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_booking/components/app_text_style.dart';
import 'package:movie_booking/components/buttons/text_button.dart';
import 'package:movie_booking/components/colors.dart';
import 'package:movie_booking/components/common_methos.dart';
import 'package:movie_booking/components/static_decoration.dart';
import 'package:movie_booking/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:movie_booking/widget/scroll_widget/seats.dart';

import '../app.dart';
import '../utils/gradient_text.dart';
import '../widget/scroll_widget/scroll_widget.dart';

class SeatBookingScreen extends StatefulWidget {
  SeatBookingScreen({
    super.key,
    required this.movieInd,
  });

  int movieInd;

  @override
  State<SeatBookingScreen> createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  HomeController homeController = Get.find<HomeController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.selectedSeatsList.clear();
    homeController.currentSelectionSeat.clear();
    homeController.update();
    dataStorages.write(
        "current_collection_id", homeController.movieIDList[widget.movieInd]);

    homeController.unavailableSeatList.value =
        homeController.movieList[widget.movieInd]["booked_seats"];
    homeController.selectedSeatsList
        .addAll(homeController.movieList[widget.movieInd]["booked_seats"]);
  }

  @override
  Widget build(BuildContext context) {
    // print( dataStorages.write("current_collection_id", homeController.data![widget.movieInd]["id"]));
    return Scaffold(
      backgroundColor: primaryWhite,
      body: CustomScrollView(
        controller: homeController.scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: header(
              movieName: homeController.movieList[widget.movieInd]["name"],
              movieDescription: homeController.movieList[widget.movieInd]
                  ["description"],
              image: homeController.movieList[widget.movieInd]["imageS"],
              imdb:
                  homeController.movieList[widget.movieInd]["imdb"].toString(),
              price:
                  homeController.movieList[widget.movieInd]["price"].toString(),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    height10,
                    Image.asset("assets/pngs/cinema_screen.png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SeatsType(
                              seatColor: greyColor, seatType: "Available"),
                          SeatsType(
                              seatColor: Color(0xff251977),
                              seatType: "Unavailable"),
                          SeatsType(
                              seatColor: greenColor,
                              seatType: "Selected by you"),
                        ],
                      ),
                    ),
                    height20,
                    GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            5, // You can adjust the number of seats per row
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                      ),
                      itemCount: 30, // Total number of seats, adjust as needed
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (homeController.unavailableSeatList
                                .contains(index)) {
                              CommonMethod().getXSnackBar(
                                  "ERROR", "Please Select Other Seats", red);
                            } else {
                              homeController.selectedSeatsList.contains(index)
                                  ? homeController.selectedSeatsList
                                      .remove(index)
                                  : homeController.selectedSeatsList.add(index);
                              homeController.currentSelectionSeat
                                      .contains(index)
                                  ? homeController.currentSelectionSeat
                                      .remove(index)
                                  : homeController.currentSelectionSeat
                                      .add(index);
                            }
                          },
                          child: Obx(
                            () => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: homeController.unavailableSeatList
                                          .contains(index)
                                      ? Color(0xff251977)
                                      : homeController.selectedSeatsList
                                              .contains(index)
                                          ? greenColor
                                          : greyColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                (index + 1).toString(),
                                style: AppTextStyle.normalBold18,
                              ),
                            ),
                          ),
                        ); // Assuming seat numbering starts from 1
                      },
                    ),
                    Obx(
                      () => 
                       homeController.currentSelectionSeat.isNotEmpty
                          ? height20
                          : SizedBox(),
                    ),
                    Obx(
                      () => homeController.currentSelectionSeat.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      TextSpan(
                                          text: 'Total Seats:- ',
                                          style: AppTextStyle.normalRegular13
                                              .copyWith(color: appColor)),
                                      TextSpan(
                                          text:
                                              ' ${homeController.currentSelectionSeat.length}',
                                          style: AppTextStyle.normalBold14
                                              .copyWith(
                                            foreground: Paint()
                                              ..shader = linearGradientText,
                                          )),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      TextSpan(
                                          text: 'Total Amount to Pay:-',
                                          style: AppTextStyle.normalRegular13
                                              .copyWith(color: appColor)),
                                      TextSpan(
                                          text:
                                              ' ${homeController.currentSelectionSeat.length * int.parse(homeController.movieList[widget.movieInd]["price"])}/~',
                                          style: AppTextStyle.normalBold14
                                              .copyWith(
                                            foreground: Paint()
                                              ..shader = linearGradientText,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                    height20,
                    Obx(
                      () => PrimaryTextButton(
                        loadingState: homeController.seatBookingState.value,
                        title: "Book Your Tickets",
                        buttonColor: Color(0xff6320EE),
                        onPressed: () {
                          homeController.updateUserSeat(
                              dataStorages.read("current_User_collection_id"));
                        },
                      ),
                    ),
                    height20,
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_booking/components/app_text_style.dart';
import 'package:movie_booking/components/colors.dart';
import 'package:movie_booking/components/static_decoration.dart';

import '../../utils/gradient_text.dart';

class SeatsType extends StatelessWidget {
  SeatsType({super.key, required this.seatColor, required this.seatType});

  Color? seatColor;
  String? seatType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: seatColor,
          ),
        ),
        width05,
        Text(
          seatType ?? "",
          style: AppTextStyle.normalRegular13.copyWith(
          
            foreground: Paint()..shader = linearGradientText,
          ),
        )
      ],
    );
  }
}

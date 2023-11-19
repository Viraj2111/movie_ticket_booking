import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_booking/components/static_decoration.dart';

import '../../components/app_text_style.dart';
import '../../components/colors.dart';

class CardTextWidget extends StatelessWidget {
   CardTextWidget({super.key, required this.name, required this.iconName});
String? name;
IconData? iconName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon( iconName! , color: primaryWhite, size: 15,),
        width05,
        Text( name! ,style: AppTextStyle.normalRegular14.copyWith(color: primaryWhite)),
      ],
    )
;
  }
}
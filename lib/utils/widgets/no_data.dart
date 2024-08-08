import 'package:assessment/utils/constants/app_icons.dart';
import 'package:assessment/utils/widgets/main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoDataToDisplay extends StatelessWidget {
  final String text;
  const NoDataToDisplay({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 160.h),
        SvgPicture.asset(AppIcons.noData),
        MainText(text: text),
      ],
    );
  }
}

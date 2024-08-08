import 'package:assessment/utils/constants/app_colors.dart';
import 'package:assessment/utils/constants/app_icons.dart';
import 'package:assessment/utils/constants/app_style.dart';
import 'package:assessment/utils/widgets/custom_transparent_inkwell.dart';
import 'package:assessment/utils/widgets/main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppHeader extends StatelessWidget {
  final String? title;
  const AppHeader({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          AppColors.primary,
          AppColors.primaryDark,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      padding: EdgeInsetsDirectional.only(
          top: 40.r, start: 16.r, end: 16.r, bottom: 16.r),
      child: Row(
        children: [
          CustomTransparentInkwell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.all(8.h),
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: AppStyles.borderRadius12,
              ),
              child: SvgPicture.asset(AppIcons.backArrow),
            ),
          ),
          SizedBox(width: 16.w),
          MainText(
            text: title ?? '',
            fontSize: 18.sp,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}

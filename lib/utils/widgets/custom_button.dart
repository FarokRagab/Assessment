import 'package:assessment/utils/constants/app_colors.dart';
import 'package:assessment/utils/constants/app_style.dart';
import 'package:assessment/utils/widgets/custom_transparent_inkwell.dart';
import 'package:assessment/utils/widgets/main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Color? color;

  final Function() onPressed;
  final double? width;
  final String text;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  final WidgetStateProperty<Color>? backgroundColor;

  const CustomButton({
    super.key,
    this.color,
    required this.onPressed,
    this.width,
    required this.text,
    this.textColor,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTransparentInkwell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height ?? 40.h,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: AppStyles.borderRadius8,
        ),
        child: MainText(
          text: text.tr,
          color: textColor ?? AppColors.white,
          fontSize: fontSize ?? 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

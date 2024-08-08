import 'package:assessment/utils/constants/app_colors.dart';
import 'package:assessment/utils/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.maxLength,
    this.contentPadding,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorMessage;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      scrollPadding: EdgeInsets.zero,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: (val) {
        if (widget.validator != null) {
          errorMessage = widget.validator!(val);
        }

        setState(() {});
      },
      style: Get.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.spMin,
          color: AppColors.grey1,
          fontFamily: 'Dubai'),
      obscureText: widget.keyboardType == TextInputType.visiblePassword
          ? obscureText
          : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: Get.textTheme.bodyLarge?.copyWith(
            color: AppColors.grey, fontSize: 12.sp, fontFamily: 'Dubai'),
        hintText: widget.hintText?.tr,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderRadius: AppStyles.borderRadius8,
          borderSide: const BorderSide(
            color: AppColors.grey8,
          ),
        ),
        alignLabelWithHint: false,
        errorText: null,
        helperText: null,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppStyles.borderRadius8,
          borderSide: BorderSide(
            color: errorMessage == null ? AppColors.grey8 : AppColors.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppStyles.borderRadius8,
          borderSide: BorderSide(
            color:
                errorMessage == null ? AppColors.primaryDark : AppColors.error,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppStyles.borderRadius8,
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppStyles.borderRadius8,
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        contentPadding:
            widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.r),
      ),
    );
  }
}

import 'dart:ui';

import 'package:assessment/utils/constants/app_colors.dart';
import 'package:assessment/utils/constants/app_enums.dart';
import 'package:assessment/utils/constants/app_icons.dart';
import 'package:assessment/utils/constants/app_strings.dart';
import 'package:assessment/utils/constants/app_values.dart';
import 'package:assessment/utils/widgets/custom_transparent_inkwell.dart';
import 'package:assessment/utils/widgets/main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class AppTools {
  Future<void> showSnackBar(
      String message, SnackEnum snackEnum, int seconds) async {
    final SnackBar snackBar = SnackBar(
      content: MainText(
        text: message,
        color: AppColors.white,
        fontSize: 12.sp,
      ),
      backgroundColor:
          snackEnum == SnackEnum.success ? AppColors.success : AppColors.error,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: AppStrings.dismiss,
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    Future.delayed(Duration(seconds: seconds), () {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });
  }

  void showSuccessSnackBar(String message, {int timer = 0}) {
    showSnackBar(message.tr, SnackEnum.success, timer);
  }

  void showErrorSnackBar(String message, {int timer = 0}) {
    showSnackBar(message.tr, SnackEnum.error, timer);
  }

  Future<dynamic> appBottomSheet({
    required String title,
    required Widget body,
    bool? isDismissible,
    bool? close,
    bool? enableDrag,
    dynamic Function()? onTapBack,
  }) {
    return Get.bottomSheet(
      isScrollControlled: true,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      barrierColor: AppColors.black.withOpacity(0.3),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.bottomSheetHandler),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainText(
                      text: title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.fontColor2),
                  close == false
                      ? const SizedBox()
                      : CustomTransparentInkwell(
                          onTap: onTapBack ?? () => Get.back(),
                          child: SvgPicture.asset(AppIcons.close),
                        ),
                ],
              ),
              SizedBox(height: 8.h),
              body,
              SizedBox(height: 8.h),
            ],
          ).paddingAll(16.h)),
        ),
      ),
    );
  }

  Future<bool> verifyBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();

    bool didAuthenticate = false;

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool isBiometricSupported = await auth.isDeviceSupported();
    if (!isEmulator) {
      try {
        if (canAuthenticateWithBiometrics && isBiometricSupported) {
          didAuthenticate = await auth.authenticate(
              localizedReason: AppStrings.authenticateToProceed,
              options: const AuthenticationOptions(
                biometricOnly: true,
                stickyAuth: true,
                useErrorDialogs: true,
              ));
        } else {
          AppTools().showErrorSnackBar(AppStrings.enableBiometrics);
        }
      } on PlatformException {
        didAuthenticate = false;
      }
    } else {
      didAuthenticate = true;
    }

    return didAuthenticate;
  }
}

import 'package:assessment/modules/home/imports/home_imports.dart';

class HomeVerifyAccount extends StatelessWidget {
  const HomeVerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      children: [
        Obx(
          () => controller.user.value.isVerified == true
              ? const SizedBox()
              : CustomTransparentInkwell(
                  onTap: () {
                    verifyAccountBottomSheet();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsetsDirectional.only(
                        start: 16.r, end: 16.r, top: 16.r),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: AppStyles.borderRadius16),
                    width: fullWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.yellowWarning),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: AppStrings.verifyYourAccount,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              MainText(
                                text: AppStrings.verifyAccDesc,
                                fontSize: 12.sp,
                                color: AppColors.greyFont,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

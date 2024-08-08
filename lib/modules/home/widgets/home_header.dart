import 'package:assessment/modules/home/imports/home_imports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(AppImages.user),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainText(
                    text: AppStrings.welcomeBack,
                    color: AppColors.fontColor1,
                  ),
                  Obx(
                    () => MainText(
                      text: '${controller.user.value.userName}!',
                      fontWeight: FontWeight.w700,
                      color: AppColors.fontColor1,
                    ),
                  )
                ],
              ),
            ],
          ),
          CustomTransparentInkwell(
            onTap: () {
              Get.to(
                () => const NotificationsView(),
                binding: NotificationsBinding(),
                transition: Transition.rightToLeft,
                curve: Curves.easeInOut,
                popGesture: true,
              );
            },
            child: Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: AppStyles.borderRadius8,
              ),
              child: SvgPicture.asset(AppIcons.notification),
            ),
          ),
        ],
      ),
    );
  }
}

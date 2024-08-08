import 'package:assessment/modules/splash/imports/splash_imports.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.purple8,
              AppColors.green9,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: controller.animation,
                  builder: (context, child) {
                    return AnimatedOpacity(
                      opacity: controller.animation.value,
                      duration: const Duration(seconds: 2),
                      child: Padding(
                        padding: EdgeInsets.all(48.w),
                        child: SvgPicture.asset(
                          AppIcons.edenred,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 40.r),
              child: const MainText(
                text: AppStrings.poweredBy,
                color: AppColors.fontColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

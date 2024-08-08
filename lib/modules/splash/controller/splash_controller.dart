
import 'package:assessment/modules/splash/imports/splash_imports.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  Future<void> onInit() async {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));
      correctPage();
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void correctPage() {
    Get.offAll(
      () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
    );
  }
}

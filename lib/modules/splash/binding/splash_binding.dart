import 'package:assessment/modules/splash/controller/splash_controller.dart';
import 'package:assessment/services/mock_service.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<MockService>(() => MockService());
  }
}

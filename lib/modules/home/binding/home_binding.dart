import 'package:assessment/modules/home/controller/home_controller.dart';
import 'package:assessment/services/mock_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MockService>(() => MockService());
  }
}

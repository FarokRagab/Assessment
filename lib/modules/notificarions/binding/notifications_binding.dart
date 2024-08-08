import 'package:assessment/modules/notificarions/controller/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(() => NotificationsController());
  }
}

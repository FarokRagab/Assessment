import 'package:assessment/modules/edit_benecifiaries/controller/edit_beneficiaries_controller.dart';
import 'package:assessment/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class EditBeneficiariesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditBeneficiariesController>(
        () => EditBeneficiariesController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

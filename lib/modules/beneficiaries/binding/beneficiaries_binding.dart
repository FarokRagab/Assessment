import 'package:assessment/modules/beneficiaries/controller/beneficiaries_controller.dart';
import 'package:get/get.dart';

class BeneficiariesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeneficiariesController>(() => BeneficiariesController());
  }
}

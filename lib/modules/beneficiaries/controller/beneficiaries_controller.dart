import 'package:assessment/modules/beneficiaries/imports/beneficiaries_imports.dart';

class BeneficiariesController extends GetxController {
  RxList<Beneficiary> beneficiaryList = Get.arguments;
  final MockService mockService = Get.find<MockService>();
  final GetStorage storage = GetStorage();

  /// Deletes a beneficiary with the given phone number.

  void deleteBeneficiary(String phoneNumber) async {
    final response = await mockService.deleteBeneficiary(phoneNumber);
    if (response.statusCode == 200 && response.body['success']) {
      beneficiaryList
          .removeWhere((beneficiary) => beneficiary.phoneNumber == phoneNumber);
      await _updateBeneficiariesStorage();
      AppTools().showSuccessSnackBar(AppStrings.beneficiaryDeletedSuccessfully);
    } else {
      AppTools().showErrorSnackBar(AppStrings.failedToDeleteBeneficiary);
    }
  }

  Future<void> _updateBeneficiariesStorage() async {
    final updatedBeneficiariesJson =
        beneficiaryList.map((b) => b.toJson()).toList();
    await storage.write('beneficiaries', updatedBeneficiariesJson);
  }

  void onConfirmDelete(BeneficiariesController controller, int index) {
    Get.back();
    controller.deleteBeneficiary(
      controller.beneficiaryList[index].phoneNumber ?? '',
    );
  }

  void onEdit(BuildContext context, Beneficiary beneficiary) {
    Get.to(
      () => const EditBeneficiariesView(),
      binding: EditBeneficiariesBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      popGesture: true,
      arguments: beneficiary,
    );
  }

  void onBeneficiaryDelete(BuildContext context, int index) {
    deleteBeneficiaryBottomSheet(index);
  }
}

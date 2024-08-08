import 'package:assessment/modules/edit_benecifiaries/imports/edit_beneficiaries_import.dart';

class EditBeneficiariesController extends GetxController {
  Beneficiary beneficiary = Get.arguments;
  GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();
  GlobalKey<FormState> nicknameKey = GlobalKey<FormState>();
  AppTools appTools = AppTools();
  TextEditingController phoneNumberController = TextEditingController(),
      nickNameController = TextEditingController();

  final GetStorage storage = GetStorage();

  RxBool isPhoneNumberChanged = false.obs, isNicknameChanged = false.obs;
  RxList<Beneficiary> beneficiariesList = <Beneficiary>[].obs;

  @override
  void onReady() {
    super.onReady();

    final List<dynamic> storedBeneficiaries =
        storage.read('beneficiaries') ?? [];
    beneficiariesList.value =
        storedBeneficiaries.map((e) => Beneficiary.fromJson(e)).toList();

    phoneNumberController.text = beneficiary.phoneNumber ?? '';
    nickNameController.text = beneficiary.nickname ?? '';

    phoneNumberController.addListener(() {
      isPhoneNumberChanged.value =
          phoneNumberController.text != beneficiary.phoneNumber;
    });

    nickNameController.addListener(() {
      isNicknameChanged.value = nickNameController.text != beneficiary.nickname;
    });
  }

  void saveEdits({required bool isNicknameEdit}) async {
    try {
      if (isNicknameEdit) {
        if (nicknameKey.currentState != null &&
            nicknameKey.currentState!.validate()) {
          if (_isDuplicateNickname(nickNameController.text)) {
            AppTools().showErrorSnackBar('Nickname already exists');
            return;
          }
          final updatedBeneficiary = Beneficiary(
            nickname: nickNameController.text,
            phoneNumber: phoneNumberController.text,
            topUpAmount: beneficiary.topUpAmount,
          );
          _updateBeneficiary(updatedBeneficiary);
          await _saveBeneficiaries();
          Get.back();
          AppTools().showSuccessSnackBar('Nickname updated successfully');
        } else {
          AppTools().showErrorSnackBar('Nickname validation failed');
        }
      } else {
        if (phoneNumberKey.currentState != null &&
            phoneNumberKey.currentState!.validate()) {
          if (_isDuplicatePhoneNumber(phoneNumberController.text)) {
            AppTools().showErrorSnackBar('Phone number already exists');
            return;
          }
          final updatedBeneficiary = Beneficiary(
            nickname: nickNameController.text,
            phoneNumber: phoneNumberController.text,
            topUpAmount: beneficiary.topUpAmount,
          );
          _updateBeneficiary(updatedBeneficiary);
          await _saveBeneficiaries();
          Get.back();
          AppTools().showSuccessSnackBar('Phone number updated successfully');
        } else {
          AppTools().showErrorSnackBar('Phone number validation failed');
        }
      }
    } catch (e) {
      AppTools().showErrorSnackBar('An error occurred while saving the edits');
    }
  }

  bool _isDuplicateNickname(String nickname) {
    return beneficiariesList.any(
        (b) => b.nickname == nickname && b.nickname != beneficiary.nickname);
  }

  bool _isDuplicatePhoneNumber(String phoneNumber) {
    return beneficiariesList.any((b) =>
        b.phoneNumber == phoneNumber &&
        b.phoneNumber != beneficiary.phoneNumber);
  }

  Future<void> _saveBeneficiaries() async {
    final List<Map<String, dynamic>> beneficiariesJson =
        beneficiariesList.map((b) => b.toJson()).toList();
    await storage.write('beneficiaries', beneficiariesJson);
  }

  void _updateBeneficiary(Beneficiary updatedBeneficiary) {
    final index = beneficiariesList
        .indexWhere((b) => b.phoneNumber == beneficiary.phoneNumber);

    if (index != -1) {
      beneficiariesList[index] = updatedBeneficiary;
    } else {
      beneficiariesList.add(updatedBeneficiary);
    }
    beneficiariesList.refresh();

    _saveBeneficiaries();
  }
}

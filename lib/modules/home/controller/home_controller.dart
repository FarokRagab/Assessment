import 'package:assessment/modules/home/imports/home_imports.dart';

class HomeController extends GetxController {
  Rx<User> user = User().obs;
  RxInt selectedChargeingValue = (-1).obs;
  final AppTools appTools = AppTools();
  final GetStorage storage = GetStorage();
  final AppValidators appValidators = AppValidators();
  final MockService mockService = Get.find<MockService>();
  RxList<Beneficiary> beneficiariesList = <Beneficiary>[].obs;
  List<int> availableChargeUnitsList = [5, 10, 20, 30, 50, 75, 100];

  GlobalKey<FormState> addBeneficiaryKey = GlobalKey<FormState>(),
      initialBalanceKey = GlobalKey<FormState>(),
      verifyAccountKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController(),
      nickNameController = TextEditingController(),
      initialBalanceController = TextEditingController(),
      emailController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    loadInitialData();
    if (user.value.balance == null || user.value.balance == 0.0) {
      enterInitialBalanceBottomSheet();
    }
  }

  /// Load initial data from storage and sets user and beneficiary information

  void loadInitialData() async {
    final userData = storage.read('user');
    final beneficiaries = storage.read('beneficiaries');

    if (userData != null) {
      user.value = User.fromJson(userData);
    } else {
      final response = await MockService().getUserData();
      if (response.statusCode == 200) {
        user.value = User.fromJson(response.body);
        storage.write('user', user.value.toJson());
      }
    }
    final balance = storage.read('balance');
    if (balance != null) {
      user.value.balance = balance;
    }

    final email = storage.read('email');
    if (email != null) {
      user.value.email = email;
    }

    final topUpAmount = storage.read('topUpAmount');
    if (topUpAmount != null) {
      user.value.topUpAmount = topUpAmount;
    }

    if (beneficiaries != null) {
      beneficiariesList.value = (beneficiaries as List)
          .map((beneficiary) => Beneficiary.fromJson(beneficiary))
          .toList();
    }
  }

  /// Adds a new beneficiary to the list if it does not already exist, and updates storage.

  Future<void> addBeneficiary(String nickname, String phoneNumber) async {
    bool exists = beneficiariesList.any(
      (beneficiary) =>
          beneficiary.nickname == nickname ||
          beneficiary.phoneNumber == phoneNumber,
    );

    if (exists) {
      appTools.showErrorSnackBar(AppStrings.existingBeneficiary);
      nickNameController.clear();
      phoneNumberController.clear();
      return;
    }

    final response = await mockService.addBeneficiary(nickname, phoneNumber);
    if (response.statusCode == 200 && response.body['success']) {
      beneficiariesList.add(
        Beneficiary(
            nickname: nickname, phoneNumber: phoneNumber, topUpAmount: 0.0),
      );

      final List<Map<String, dynamic>> beneficiariesJson =
          beneficiariesList.map((b) => b.toJson()).toList();

      await storage.write('beneficiaries', beneficiariesJson);
      appTools.showSuccessSnackBar(AppStrings.beneficiaryAddedSuccessfully);
    } else {
      appTools.showErrorSnackBar(AppStrings.failedToAddBeneficiary);
      nickNameController.clear();
      phoneNumberController.clear();
    }
    nickNameController.clear();
    phoneNumberController.clear();
  }

  /// Verifies the user's email and updates the user data if successful.

  Future<void> verifyEmail() async {
    Get.back();
    final response = await mockService.verifyUserEmail(emailController.text);
    if (response.statusCode == 200 && response.body['success']) {
      user.value.isVerified = true;
      user.value.email = emailController.text;
      user.update((val) {
        val?.isVerified = true;
        val?.email = emailController.text;
      });

      await _saveUser(user.value);
      appTools.showSuccessSnackBar(AppStrings.emailVerified);
    } else {
      appTools.showErrorSnackBar(AppStrings.emailVerificationFailed);
    }
  }

  /// Saves the user's details to storage.

  Future<void> _saveUser(User user) async {
    final userJson = user.toJson();
    await storage.write('user', userJson);
    await storage.write('is_verified', user.isVerified);
    await storage.write('email', user.email);
    await storage.write('topUpAmount', user.topUpAmount);
  }

  /// Performs a top-up for a beneficiary if all conditions are met, and updates the user's balance and top-up amounts.

  Future<void> beneficiryTopUp(
      String phoneNumber, int amount, int index) async {
    Get.back();

    if (user.value.balance! < amount + 1) {
      appTools.showErrorSnackBar(AppStrings.insufficientBalance);
      return;
    }

    if ((user.value.topUpAmount ?? 0.0) + amount > 3000) {
      appTools.showErrorSnackBar(AppStrings.exceededMonthlyLimit);
      return;
    }

    if (user.value.isVerified == true) {
      double currentAmount = beneficiariesList[index].topUpAmount ?? 0.0;
      if (currentAmount + amount > 1000) {
        appTools.showErrorSnackBar(
            AppStrings.exceededBeneficiarytopUpLimitForVerifiedAccount);
        return;
      }
    } else {
      double x = beneficiariesList[index].topUpAmount ?? 0.0;
      if (x + amount > 500) {
        appTools.showErrorSnackBar(
            AppStrings.exceededBeneficiarytopUpLimitForUnerifiedAccount);
        return;
      }
    }

    user.value.balance = user.value.balance! - (amount + 1);
    storage.write('balance', user.value.balance);
    user.value.topUpAmount = user.value.topUpAmount! + amount;
    storage.write('topUpAmount', user.value.topUpAmount);

    beneficiariesList[index].topUpAmount =
        beneficiariesList[index].topUpAmount! + amount;

    final List<Map<String, dynamic>> beneficiariesJson =
        beneficiariesList.map((b) => b.toJson()).toList();
    await storage.write('beneficiaries', beneficiariesJson);

    appTools.showSuccessSnackBar(AppStrings.topUpSuccessful);
    user.update((val) {
      val?.balance = user.value.balance!;
    });
  }

  /// Authenticates the user with biometrics and performs a top-up if authentication is successful.

  Future<void> authenticateWithBiometrics({required int index}) async {
    bool didAuthenticate = await appTools.verifyBiometrics();
    if (didAuthenticate) {
      await beneficiryTopUp(beneficiariesList[index].phoneNumber ?? '',
          selectedChargeingValue.value, index);
    } else {
      appTools.showErrorSnackBar(AppStrings.authenticationFailed);
    }
  }
}

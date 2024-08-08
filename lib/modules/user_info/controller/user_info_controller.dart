import 'package:assessment/modules/user_info/imports/user_info_imports.dart';

class UserInfoController extends GetxController {
  late Rx<User> user;
  late List<Map<String, String>> userInfoItems;
  late double availableForTopUp;

  @override
  void onInit() {
    super.onInit();
    user = Rx<User>(Get.arguments);
    availableForTopUp = 3000 - (user.value.topUpAmount ?? 0.0);
    userInfoItems = [
      {
        'title': user.value.userName ?? AppStrings.nameNotAvailable,
        'subtitle': AppStrings.username,
      },
      {
        'title': user.value.phoneNumber ?? AppStrings.phineNotAvailable,
        'subtitle': AppStrings.phoneNumber,
      },
      {
        'title': user.value.balance?.toString() ?? '0.0',
        'subtitle': AppStrings.currentBalance,
      },
      {
        'title': user.value.topUpAmount.toString(),
        'subtitle': AppStrings.topUpAmount,
      },
      {
        'title': availableForTopUp.toString(),
        'subtitle': AppStrings.availableForTopUp,
      },
      {
        'title': user.value.email ?? AppStrings.notVerified,
        'subtitle': AppStrings.email,
      },
    ];
  }
}

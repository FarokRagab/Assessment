import 'package:assessment/utils/constants/app_strings.dart';
import 'package:get/get.dart';

class AppValidators {
  String? emailValidation(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return AppStrings.requiredField;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  String? nameValidation(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return AppStrings.requiredField.tr;
    } else if (value.length > 20) {
      return AppStrings.nickNameLength;
    }
    return null;
  }

  String? balanceValidation(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return AppStrings.requiredField.tr;
    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
      return AppStrings.onlyNumericAllowed;
    } else {
      if (value.length < 4) {
        return AppStrings.minimumInitialBalance;
      }
      final intBalance = int.parse(value);

      if (intBalance > 10000) {
        return AppStrings.maximumBalance;
      }
    }
    return null;
  }

  String? phoneValidation(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return AppStrings.requiredField.tr;
    } else if (value.length != 9) {
      return AppStrings.phoneLength;
    }
    return null;
  }
}

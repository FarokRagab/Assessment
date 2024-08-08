import 'package:assessment/modules/edit_benecifiaries/imports/edit_beneficiaries_import.dart';

Future<dynamic> editBeneficiaryNicknameBottomSheet() {
  final EditBeneficiariesController controller = Get.find();
  final HomeController homeController = Get.find<HomeController>();

  return AppTools().appBottomSheet(
    title: AppStrings.editNickname,
    body: Form(
      key: controller.nicknameKey,
      child: Column(
        children: [
          CustomTextField(
            maxLength: 20,
            controller: controller.nickNameController,
            keyboardType: TextInputType.text,
            validator: (value) {
              return AppValidators().nameValidation(value);
            },
            hintText: AppStrings.nickname,
          ),
          SizedBox(height: 16.h),
          Obx(
            () => CustomButton(
              onPressed: controller.isNicknameChanged.value
                  ? () {
                      if (controller.nicknameKey.currentState!.validate()) {
                        controller.saveEdits(isNicknameEdit: true);
                        homeController.loadInitialData();
                        Get.back();
                      }
                    }
                  : () {},
              text: AppStrings.saveBtn,
              color: controller.isNicknameChanged.value
                  ? AppColors.primary
                  : AppColors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

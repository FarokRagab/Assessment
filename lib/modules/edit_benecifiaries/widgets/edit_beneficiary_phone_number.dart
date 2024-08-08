import 'package:assessment/modules/edit_benecifiaries/imports/edit_beneficiaries_import.dart';

Future<dynamic> editBeneficiaryPhoneNumberBottomSheet() {
  final EditBeneficiariesController controller = Get.find();
  final HomeController homeController = Get.find<HomeController>();

  return AppTools().appBottomSheet(
    title: AppStrings.editPhoneNumber,
    body: Form(
      key: controller.phoneNumberKey,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.phoneNumberController,
            keyboardType: TextInputType.phone,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.r),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppIcons.uaeFlag),
                  SizedBox(width: 8.w),
                  MainText(
                    text: '+971',
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            validator: (value) {
              return AppValidators().phoneValidation(value);
            },
            hintText: AppStrings.phoneHint,
          ),
          SizedBox(height: 16.h),
          Obx(
            () => CustomButton(
              onPressed: controller.isPhoneNumberChanged.value
                  ? () {
                      if (controller.phoneNumberKey.currentState!.validate()) {
                        controller.saveEdits(isNicknameEdit: false);
                        homeController.loadInitialData();
                        Get.back();
                      }
                    }
                  : () {},
              text: AppStrings.saveBtn,
              color: controller.isPhoneNumberChanged.value
                  ? AppColors.primary
                  : AppColors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:assessment/modules/home/imports/home_imports.dart';

Future<dynamic> addBeneficiaryBottomSheet(HomeController controller) {
  return AppTools().appBottomSheet(
    title: AppStrings.addBeneficiary,
    onTapBack: () {
      Get.back();
      controller.nickNameController.clear();
      controller.phoneNumberController.clear();
    },
    body: Form(
      key: controller.addBeneficiaryKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.r, bottom: 4.r),
            child: const MainText(
              text: AppStrings.nickname,
              fontWeight: FontWeight.w600,
            ),
          ),
          CustomTextField(
            maxLength: 20,
            controller: controller.nickNameController,
            keyboardType: TextInputType.text,
            validator: (value) {
              return AppValidators().nameValidation(value);
            },
            hintText: AppStrings.nickname,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 4.r, bottom: 4.r),
            child: const MainText(
              text: AppStrings.phoneNumber,
              fontWeight: FontWeight.w600,
            ),
          ),
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
          CustomButton(
            onPressed: () {
              if (controller.addBeneficiaryKey.currentState!.validate()) {
                controller.addBeneficiary(
                  controller.nickNameController.text,
                  controller.phoneNumberController.text,
                );
                Get.back();
              }
            },
            text: AppStrings.saveBtn,
          )
        ],
      ),
    ),
  );
}

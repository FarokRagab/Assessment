import 'package:assessment/modules/home/imports/home_imports.dart';

Future<dynamic> verifyAccountBottomSheet() {
  final HomeController controller = Get.find();
  return AppTools().appBottomSheet(
      title: AppStrings.accVerification,
      body: Form(
        key: controller.verifyAccountKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                MainText(
                  text: AppStrings.accVerificationTitle,
                  color: AppColors.grey,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.r),
              child: CustomTextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return AppValidators().emailValidation(value);
                },
                hintText: AppStrings.email,
              ),
            ),
            CustomButton(
              onPressed: () {
                if (controller.verifyAccountKey.currentState!.validate()) {
                  controller.verifyEmail();
                }
              },
              text: AppStrings.verifyBtn,
            )
          ],
        ),
      ));
}

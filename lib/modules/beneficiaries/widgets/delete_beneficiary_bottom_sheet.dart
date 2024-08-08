import 'package:assessment/modules/beneficiaries/imports/beneficiaries_imports.dart';

Future<dynamic> deleteBeneficiaryBottomSheet(int index) {
  final BeneficiariesController controller = Get.find();
  return AppTools().appBottomSheet(
    title: AppStrings.deleteBeneficiary,
    body: Column(
      children: [
        SvgPicture.asset(AppIcons.warning),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MainText(text: AppStrings.deleteBeneficiaryConformation),
            SizedBox(width: 4.w),
            MainText(
              text: '${controller.beneficiaryList[index].nickname}?',
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomButton(
          onPressed: () => controller.onConfirmDelete(controller, index),
          text: AppStrings.delete,
        ),
      ],
    ),
  );
}

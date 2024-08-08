import 'package:assessment/modules/edit_benecifiaries/imports/edit_beneficiaries_import.dart';

class EditBeneficiariesView extends GetView<EditBeneficiariesController> {
  const EditBeneficiariesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const AppHeader(title: AppStrings.editBeneficiary),
          Container(
            width: fullWidth,
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
            margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
            decoration: BoxDecoration(
              borderRadius: AppStyles.borderRadius24,
              color: AppColors.white,
            ),
            child: Column(
              children: [
                EditBeneficiaryTile(
                  title: '+971 ${controller.beneficiary.phoneNumber}',
                  subTitle: AppStrings.phoneNumber,
                  onTap: () {
                    editBeneficiaryPhoneNumberBottomSheet();
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: const Divider(),
                ),
                EditBeneficiaryTile(
                  title: controller.beneficiary.nickname ?? '',
                  subTitle: AppStrings.nickname,
                  onTap: () {
                    editBeneficiaryNicknameBottomSheet();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

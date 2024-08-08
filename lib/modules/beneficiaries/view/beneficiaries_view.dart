import 'package:assessment/modules/beneficiaries/imports/beneficiaries_imports.dart';

class BeneficiariesView extends GetView<BeneficiariesController> {
  const BeneficiariesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const AppHeader(title: AppStrings.beneficiaries),
          SizedBox(height: 16.h),
          Obx(
            () => controller.beneficiaryList.isEmpty
                ? const SizedBox()
                : const MainText(
                    text: AppStrings.swipeLeft,
                    color: AppColors.grey,
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Obx(
              () => controller.beneficiaryList.isEmpty
                  ? const NoDataToDisplay(text: AppStrings.noBeneficiariesAdded)
                  : const BeneficiariesList(),
            ),
          ),
        ],
      ),
    );
  }
}

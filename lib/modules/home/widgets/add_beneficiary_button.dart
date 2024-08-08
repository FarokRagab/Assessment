import 'package:assessment/modules/home/imports/home_imports.dart';

class AddBeneficiaryButton extends StatelessWidget {
  const AddBeneficiaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return GestureDetector(
      onTap: () {
        addBeneficiaryBottomSheet(controller);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
        width: fullWidth / 2.8,
        height: 120.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppStyles.borderRadius24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.circularPlus),
            SizedBox(height: 8.h),
            const MainText(
              text: AppStrings.addBeneficiary,
              color: AppColors.greyFont,
            ),
          ],
        ),
      ),
    );
  }

 
}





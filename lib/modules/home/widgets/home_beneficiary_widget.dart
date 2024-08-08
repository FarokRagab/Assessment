import 'package:assessment/modules/home/imports/home_imports.dart';

class HomeBeneficiaryWidget extends StatelessWidget {
  final int index;

  const HomeBeneficiaryWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 16.r),
      margin: EdgeInsetsDirectional.only(end: 8.r),
      width: fullWidth / 2.8,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppStyles.borderRadius24,
      ),
      child: Column(
        children: [
          MainText(
            text: controller.beneficiariesList[index].nickname ?? '',
            color: AppColors.fontColor3,
            fontWeight: FontWeight.w700,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 4.r, bottom: 16.r),
            child: MainText(
              text: '+971 ${controller.beneficiariesList[index].phoneNumber}',
              color: AppColors.primaryLight3,
              fontSize: 12.sp,
            ),
          ),
          CustomButton(
            text: AppStrings.recharge,
            height: 24.h,
            fontSize: 12.sp,
            onPressed: () {
              controller.selectedChargeingValue.value = -1;
              topUpBenecifiaryBottomSheet(index: index);
            },
          )
        ],
      ),
    );
  }
}

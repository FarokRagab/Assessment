import 'package:assessment/modules/beneficiaries/imports/beneficiaries_imports.dart';

class BeneficiariesWidget extends StatelessWidget {
  final Beneficiary model;

  const BeneficiariesWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
      margin: EdgeInsetsDirectional.only(bottom: 8.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppStyles.borderRadius16,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: MainText(
          text: model.nickname ?? '',
          color: AppColors.fontColor3,
          fontWeight: FontWeight.w600,
        ),
        subtitle: MainText(
          text: '+971 ${model.phoneNumber}',
          color: AppColors.primaryLight3,
          fontWeight: FontWeight.w600,
        ),
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            borderRadius: AppStyles.borderRadius8,
            gradient: const LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primaryDark,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SvgPicture.asset(AppIcons.user),
        ),
      ),
    );
  }
}

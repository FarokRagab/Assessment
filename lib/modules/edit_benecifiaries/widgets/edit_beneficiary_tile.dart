import 'package:assessment/modules/edit_benecifiaries/imports/edit_beneficiaries_import.dart';

class EditBeneficiaryTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final dynamic Function() onTap;

  const EditBeneficiaryTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainText(
              text: title,
            ),
            MainText(
              text: subTitle,
              fontSize: 12.sp,
              color: AppColors.grey,
            ),
          ],
        ),
        CustomTransparentInkwell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.primaryLight2,
              borderRadius: AppStyles.borderRadius12,
            ),
            child: SvgPicture.asset(AppIcons.editIcon),
          ),
        )
      ],
    );
  }
}

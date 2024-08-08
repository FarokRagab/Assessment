import 'package:assessment/modules/beneficiaries/imports/beneficiaries_imports.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BeneficiariesList extends StatelessWidget {
  const BeneficiariesList({super.key});

  @override
  Widget build(BuildContext context) {
    final BeneficiariesController controller = Get.find();

    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.beneficiaryList.length,
        itemBuilder: (context, index) {
          final beneficiary = controller.beneficiaryList[index];
          return Slidable(
            key: Key(beneficiary.phoneNumber.toString()),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.40,
              children: [
                SlidableAction(
                  onPressed: (_) => controller.onEdit(context, beneficiary),
                  backgroundColor: AppColors.transparent,
                  foregroundColor: Colors.green,
                  icon: Icons.edit,
                  label: AppStrings.edit,
                  padding: EdgeInsets.symmetric(vertical: 4.r),
                ),
                SlidableAction(
                  onPressed: (_) =>
                      controller.onBeneficiaryDelete(context, index),
                  backgroundColor: AppColors.transparent,
                  foregroundColor: Colors.red,
                  icon: Icons.delete_outline_outlined,
                  label: AppStrings.delete,
                  padding: EdgeInsets.symmetric(vertical: 4.r),
                ),
              ],
            ),
            child: BeneficiariesWidget(model: beneficiary),
          );
        },
      ),
    );
  }
}

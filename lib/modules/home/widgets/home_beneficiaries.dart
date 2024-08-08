import 'package:assessment/modules/home/imports/home_imports.dart';

class HomeBeneficiaryList extends StatelessWidget {
  const HomeBeneficiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Obx(
      () => Column(
        children: [
          controller.beneficiariesList.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsetsDirectional.only(top: 24.r, bottom: 16.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainText(
                        text: AppStrings.beneficiaries,
                        color: AppColors.fontColor2,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomTransparentInkwell(
                        onTap: () {
                          Get.to(
                            () => const BeneficiariesView(),
                            binding: BeneficiariesBinding(),
                            transition: Transition.rightToLeft,
                            curve: Curves.easeInOut,
                            popGesture: true,
                            arguments: controller.beneficiariesList,
                          );
                        },
                        child: const MainText(
                          text: AppStrings.edit,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
          controller.beneficiariesList.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.r),
                  child: const Center(
                    child: AddBeneficiaryButton(),
                  ),
                )
              : const SizedBox(),
          controller.beneficiariesList.isEmpty
              ? const SizedBox()
              : ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 120.h,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.beneficiariesList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.beneficiariesList.length) {
                        return HomeBeneficiaryWidget(index: index);
                      } else if (controller.beneficiariesList.length == 5) {
                        return const SizedBox();
                      } else {
                        return const AddBeneficiaryButton();
                      }
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

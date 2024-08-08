import 'package:assessment/modules/home/imports/home_imports.dart';

Future<dynamic> topUpBenecifiaryBottomSheet({required int index}) {
  final HomeController controller = Get.find();

  return AppTools().appBottomSheet(
    title:
        '${AppStrings.recharge} ${controller.beneficiariesList[index].nickname}',
    onTapBack: () {
      Get.back();
      controller.selectedChargeingValue.value = (-1);
    },
    body: Obx(
      () => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.availableChargeUnitsList.length,
            itemBuilder: (context, index) => CustomTransparentInkwell(
              onTap: () {
                controller.selectedChargeingValue.value =
                    controller.availableChargeUnitsList[index];
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                margin: EdgeInsetsDirectional.only(
                    bottom:
                        controller.availableChargeUnitsList.length - 1 == index
                            ? 16.r
                            : 8.r),
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: AppStyles.borderRadius16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MainText(
                          text: controller.availableChargeUnitsList[index]
                              .toString(),
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        const MainText(
                          text: AppStrings.aed,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    Obx(
                      () => controller.selectedChargeingValue.value ==
                              controller.availableChargeUnitsList[index]
                          ? SvgPicture.asset(AppIcons.checked)
                          : SvgPicture.asset(AppIcons.unchecked),
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomButton(
            onPressed: controller.selectedChargeingValue.value == -1
                ? () {}
                : () {
                    if (isEmulator) {
                      controller.beneficiryTopUp(
                          controller.beneficiariesList[index].phoneNumber ?? '',
                          controller.selectedChargeingValue.value,
                          index);
                    } else {
                      Get.back();
                      controller.authenticateWithBiometrics(index: index);
                    }
                  },
            text: AppStrings.recharge,
            color: controller.selectedChargeingValue.value == -1
                ? AppColors.grey
                : AppColors.primary,
          )
        ],
      ),
    ),
  );
}

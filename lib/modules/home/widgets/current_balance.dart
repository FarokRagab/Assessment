import 'package:assessment/modules/home/imports/home_imports.dart';

class HomeScreenCurrentBalance extends GetView<HomeController> {
  const HomeScreenCurrentBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainText(
          text: AppStrings.balance,
          color: AppColors.fontColor2,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.h),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppStyles.borderRadius16,
          ),
          padding: EdgeInsets.symmetric(vertical: 16.r),
          height: 170.h,
          child: Obx(
            () => SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 10000,
                  showLabels: false,
                  startAngle: 180,
                  endAngle: 0,
                  showTicks: false,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 0.1,
                    cornerStyle: CornerStyle.bothCurve,
                    color: AppColors.primaryLight2,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: controller.user.value.balance ?? 0,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.1,
                      color: AppColors.primary,
                      sizeUnit: GaugeSizeUnit.factor,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Padding(
                        padding: EdgeInsetsDirectional.only(top: 24.r),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => MainText(
                                    text: controller.user.value.balance == null
                                        ? 0.0.toString()
                                        : controller.user.value.balance
                                            .toString(),
                                    color: AppColors.fontColor2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const MainText(
                                  text: AppStrings.aed,
                                  color: AppColors.fontColor2,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            const MainText(
                              text: AppStrings.availableBalance,
                              color: AppColors.greyFont,
                              fontSize: 12,
                            ),
                            SizedBox(height: 24.h),
                            CustomButton(
                              onPressed: () {
                                Get.to(
                                  () => const UserInfoView(),
                                  binding: UserInfoBinding(),
                                  transition: Transition.rightToLeft,
                                  curve: Curves.easeInOut,
                                  popGesture: true,
                                  arguments: controller.user.value,
                                );
                              },
                              text: AppStrings.moreBtn,
                              fontSize: 12.sp,
                              width: 150.w,
                              height: 32.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<dynamic> enterInitialBalanceBottomSheet() {
  final HomeController controller = Get.find();
  return controller.appTools.appBottomSheet(
    isDismissible: false,
    close: false,
    enableDrag: false,
    title: AppStrings.addInitialBalance,
    body: Form(
      key: controller.initialBalanceKey,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.initialBalanceController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              return controller.appValidators.balanceValidation(value);
            },
          ),
          SizedBox(height: 16.h),
          CustomButton(
            onPressed: () {
              if (controller.initialBalanceKey.currentState!.validate()) {
                controller.user.value.balance =
                    double.parse(controller.initialBalanceController.text);
                controller.storage
                    .write('balance', controller.user.value.balance!);

                controller.user.update((val) {
                  val?.balance = controller.user.value.balance!;
                });
                Get.back();
              }
            },
            text: AppStrings.saveBtn,
          )
        ],
      ),
    ),
  );
}

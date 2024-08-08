import 'package:assessment/modules/user_info/imports/user_info_imports.dart';

class UserInfoView extends GetView<UserInfoController> {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const AppHeader(title: AppStrings.myAccount),
          Container(
            width: fullWidth,
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
            margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
            decoration: BoxDecoration(
              borderRadius: AppStyles.borderRadius24,
              color: AppColors.white,
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.userInfoItems.length,
              itemBuilder: (context, index) {
                final item = controller.userInfoItems[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(text: item['title']!),
                            MainText(
                              text: item['subtitle']!,
                              fontSize: 12,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (index < controller.userInfoItems.length - 1)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.r),
                        child: const Divider(),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

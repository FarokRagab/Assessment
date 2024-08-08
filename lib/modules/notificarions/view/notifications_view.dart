import 'package:assessment/modules/notificarions/imports/notifications_imports.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const AppHeader(title: AppStrings.notifications),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.notificationsList.length,
            itemBuilder: (context, index) => CustomNotificationWidget(
              title: controller.notificationsList[index].title,
              time: controller.notificationsList[index].time,
              description: controller.notificationsList[index].description,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNotificationWidget extends StatelessWidget {
  final String title;
  final String description;
  final String time;

  const CustomNotificationWidget({
    super.key,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTransparentInkwell(
      onTap: () {},
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 16.r, start: 16.r, end: 16.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppStyles.borderRadius16,
        ),
        child: ListTile(
          title: MainText(
            text: title,
            fontWeight: FontWeight.w600,
          ),
          subtitle: MainText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: description,
            fontSize: 14,
            color: AppColors.greyFont,
          ),
          trailing: MainText(
            text: time,
            fontSize: 14,
            color: AppColors.greyFont,
          ),
        ),
      ),
    );
  }
}

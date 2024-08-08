import 'package:assessment/modules/notificarions/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  RxList<NotificationModel> notificationsList = <NotificationModel>[
    NotificationModel(
      title: 'Top Up Successful',
      description: 'Your top-up transaction has been completed successfully.',
      time: '11:00 AM',
    ),
    NotificationModel(
      title: 'New Beneficiary Added',
      description: 'A new beneficiary has been added to your account.',
      time: '12:30 PM',
    ),
    NotificationModel(
      title: 'Low Balance Alert',
      description: 'Your account balance is running low. Please top up soon.',
      time: '02:15 PM',
    ),
    NotificationModel(
      title: 'Promotional Offer',
      description: 'Enjoy a 10% bonus on all top-ups this weekend!',
      time: '04:00 PM',
    ),
    NotificationModel(
      title: 'Transaction Failed',
      description: 'Your recent top-up transaction could not be processed.',
      time: '06:45 PM',
    ),
  ].obs;
}

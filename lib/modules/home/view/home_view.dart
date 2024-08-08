import 'package:assessment/modules/home/imports/home_imports.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const HomeVerifyAccount(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.r,
                vertical: 16.r,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeScreenCurrentBalance(),
                  HomeBeneficiaryList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

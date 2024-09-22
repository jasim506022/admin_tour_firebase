import 'package:bd_tour_firebase_admin/res/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_page_controller.dart';
import '../../res/apps_colors.dart';
import '../../res/routes/routes_name.dart';
import '../../res/string_constant.dart';
import '../../widget/responsive.dart';

import 'widget/side_menu_widget.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainPage({super.key, required this.child, required this.scaffoldKey});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageController mainController = Get.find();

  @override
  void initState() {
    mainController.updateLocalData(context);
    mainController.updateStateBasedOnRoute(ConstantData.sharedPreference!
            .getString(StringConstant.currentPathSharePre) ??
        RoutesPath.dashboardScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (mainController.isLoading.value) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: AppColors.white,
              strokeWidth: 4,
            ),
          ),
        );
      } else {
        return Scaffold(
          key: widget.scaffoldKey,
          drawer: const SideMenuWidget(),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                const Expanded(
                  child: SideMenuWidget(),
                ),
              Expanded(
                flex: 5,
                child: widget.child,
              ),
            ],
          ),
        );
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/main_page_controller.dart';
import '../../../controller/save_local.dart';
import '../../../model/menu_model.dart';
import '../../../res/apps_colors.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    return Drawer(
      key: UniqueKey(),
      backgroundColor: AppColors.secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "asset/image/logo.png",
                  height: 80,
                  width: 80,
                ),
                Text(
                  "BD Tours",
                  style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            )),
            Column(
              children: SidebarItem.values.map((item) {
                return Obx(
                  () => ListTile(
                    onTap: () {
                      controller.onChangeState(currentState: item.value);
                      SaveDataLocalStorage.saveCurrentRouthPath(item.pathName);
                      context.goNamed(item.value);
                    },
                    leading: Icon(
                      item.iconData,
                      color: controller.currentState.value == item.value
                          ? Colors.yellow
                          : Colors.white54,
                      size: 20,
                    ),
                    title: Text(
                      item.value,
                      style: GoogleFonts.poppins(
                          color: controller.currentState.value == item.value
                              ? AppColors.yellow
                              : AppColors.white.withOpacity(.54),
                          fontWeight:
                              controller.currentState.value == item.value
                                  ? FontWeight.bold
                                  : FontWeight.w500),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

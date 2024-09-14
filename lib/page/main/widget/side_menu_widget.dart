import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../const/const.dart';
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
      backgroundColor:AppColors. secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(child: Icon(Icons.save)),
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
                      style: TextStyle(
                        color: controller.currentState.value == item.value
                            ? Colors.yellow
                            : Colors.white54,
                      ),
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

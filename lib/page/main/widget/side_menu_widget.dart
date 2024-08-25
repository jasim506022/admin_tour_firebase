import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../const/const.dart';
import '../../../controller/loading_controller.dart';


class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoadingController controller = Get.put(LoadingController());
    return Drawer(
      backgroundColor: secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(child: Icon(Icons.save)),
            Column(
              children: SidebarItem.values.map((item) {
                return Obx(
                  () => ListTile(
                    onTap: () {
                      controller.setIndex(index: item.value);
                      context.goNamed(item.name);
                    },
                    leading: Icon(
                      item.iconData,
                      color: controller.selectIndex.value == item.value
                          ? Colors.yellow
                          : Colors.white54,
                      size: 20,
                    ),
                    title: Text(
                      item.value,
                      style: TextStyle(
                        color: controller.selectIndex.value == item.value
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




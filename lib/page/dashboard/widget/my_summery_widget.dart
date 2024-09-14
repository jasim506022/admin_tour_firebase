import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/const.dart';
import '../../../controller/main_page_controller.dart';
import '../../../model/menu_model.dart';
import '../../../res/apps_function.dart';
import '../../../res/constant.dart';
import '../../../widget/responsive.dart';
import 'summery_grid_view.dart';

class MySummeryWidget extends StatelessWidget {
  const MySummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Summery",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            ElevatedButton.icon(
              onPressed: () {
                AppsFunction.navigatorChange(
                    context, controller, SidebarItem.addTourScreen);
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF00396A),
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantData.defaultPadding * 1.5,
                      vertical: ConstantData.defaultPadding)),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                "Add New Tour",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            )
          ],
        ),
        const SizedBox(
          height: ConstantData.defaultPadding,
        ),
        Responsive(
            mobile: SummeryGridView(
                crossAxisCount: mq.width < 650 ? 2 : 4,
                childAspectRatio: mq.width < 650 && mq.width > 350 ? 1.3 : 1),
            tablet: const SummeryGridView(),
            desktop:
                SummeryGridView(childAspectRatio: mq.width < 1400 ? 1.1 : 1.4)),
      ],
    );
  }
}

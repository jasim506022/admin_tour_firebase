import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/guide_controller.dart';
import '../../res/apps_colors.dart';
import '../../res/constant.dart';
import '../../widget/search_widget_text_field.dart';
import 'widget/table_header_widget.dart';
import 'widget/person_list_builder_widget.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var guideController = Get.find<GuideController>();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(ConstantData.defaultPadding),
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            SearchWidgetTextField(
              controller: guideController.searchGuideTextTEC,
              onChanged: (text) {
                guideController.filterGuiders(text);
              },
              hint: 'Search Guide',
            ),
            const TableHeaderWidget(),
            const SizedBox(
              height: ConstantData.defaultPadding,
            ),
            const Expanded(
              child: PersonListBuilder(
                isUser: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

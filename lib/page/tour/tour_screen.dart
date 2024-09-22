

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/tour_controller.dart';
import '../../res/constant.dart';
import '../../widget/category_drop_down_widget.dart';
import '../../widget/grid_tour_list_widget.dart';
import '../../widget/error_widget.dart';
import '../../widget/loading_tour_list_widget.dart';


class TourScreen extends StatelessWidget {
  const TourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tourController = Get.find<TourController>();
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: ConstantData.defaultPadding,
        ),
        const CategoryDropDownWidget(
          margin: ConstantData.defaultPadding,
        ),
        const SizedBox(
          height: ConstantData.defaultPadding,
        ),
        Expanded(
          child: Obx(
            () => StreamBuilder(
              stream: tourController.tourSnapshot(context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingTourWidgetList();
                }
                if (snapshot.hasError) {
                  return FirebaseErrorWidget(
                    title: snapshot.error.toString(),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const FirebaseErrorWidget(
                    title:
                        "No Data Available. Nothing to display at this time.",
                  );
                }
                if (snapshot.hasData) {
                  return  GridTourListWidget(
                    isSearch: true,
                    snapshot: snapshot ,
                  );
                }
                return const LoadingTourWidgetList();
              },
            ),
          ),
        ),
      ],
    ));
  }

}

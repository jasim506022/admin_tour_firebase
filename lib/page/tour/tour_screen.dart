
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../const/const.dart';
import '../../controller/tour_controller.dart';
import '../../model/tour_model.dart';
import '../../res/constant.dart';
import '../../widget/category_drop_down_widget.dart';
import '../../widget/responsive.dart';
import 'widget/error_widget.dart';
import 'widget/loading_tour_list_widget.dart';
import 'widget/tour_widget.dart';

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
                  return _buildTourGrid(snapshot, context);
                }
                return const LoadingTourWidgetList();
              },
            ),
          ),
        ),
      ],
    ));
  }

  GridView _buildTourGrid(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data!.docs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
          childAspectRatio: Responsive.isMobile(context)
              ? mq.width < 500 && mq.width < 600
                  ? 2
                  : 0.8
              : .76),
      itemBuilder: (context, index) {
        TourModel tourModel =
            TourModel.fromMap(snapshot.data!.docs[index].data());
        return ChangeNotifierProvider.value(
            value: tourModel, child: TourWidget(index: index));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/tour_controller.dart';
import '../model/tour_model.dart';
import '../page/tour/widget/custom_button_widget.dart';
import '../res/apps_colors.dart';

class DialogDeleteTourWidget extends StatelessWidget {
  const DialogDeleteTourWidget({
    super.key,
    required this.tourModel,
  });

  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    var tourController = Get.find<TourController>();
    return AlertDialog(
      backgroundColor: AppColors.secondaryColor,
      title: const Text(
        "Are you sure you want to delete this tour?",
        style: TextStyle(
            color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: const Text(
          "This will delete this tour Permanently. You cannot undo this action"),
      actions: [
        CustomButtonTourWidget(
          backgroundColor: AppColors.red,
          title: "Yes",
          function: () {
            tourController.deleteTour(id: tourModel.id!, context: context);
            Navigator.pop(context);
          },
          borderColor: AppColors.red,
          textColor: AppColors.white,
        ),
        CustomButtonTourWidget(
          backgroundColor: AppColors.secondaryColor,
          title: "No",
          function: () {
            Navigator.pop(context);
          },
          borderColor: AppColors.deepGreen,
          textColor: AppColors.white,
        ),
      ],
    );
  }
}

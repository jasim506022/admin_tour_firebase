import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_tour_controller.dart';
import '../../res/apps_colors.dart';
import '../../res/constant.dart';
import '../../widget/responsive.dart';

class ImageListGridView extends StatelessWidget {
  const ImageListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controllers = Get.find<AddTourController>();
    return Obx(
      () => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5),
        itemCount: controllers.imageXFileList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: AppColors.white.withOpacity(0.54), width: 2)),
                  height: ConstantData.mq.height * .5,
                  margin: const EdgeInsets.all(15),
                  width: ConstantData.mq.height * .5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: controllers.imageXFileList[index] is String
                        ? Image.network(controllers.imageXFileList[index])
                        : Image.network(
                            File(controllers.imageXFileList[index].path).path,
                            fit: BoxFit.fill),
                  )),
              InkWell(
                onTap: () {
                  controllers.removeImage(index: index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.red),
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

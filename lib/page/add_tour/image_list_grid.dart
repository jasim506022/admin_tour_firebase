import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_tour_controller.dart';

class ImageListGridView extends StatelessWidget {
  const ImageListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controllers = Get.put(AddTourController());
    return Obx( () =>
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
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
                        border: Border.all(color: Colors.white54, width: 2)),
                    height: MediaQuery.of(context).size.height*.5,
                    margin: const EdgeInsets.all(15),
                    //180
                    width: MediaQuery.of(context).size.height*.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          File(controllers.imageXFileList[index].path).path,
                          fit: BoxFit.fill),
                    )),
                InkWell(
                  onTap: () {
                    controllers.imageXFileList.removeAt(index);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    height: 30,
                    width: 30,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
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
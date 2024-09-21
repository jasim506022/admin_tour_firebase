import 'package:bd_tour_firebase_admin/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../res/apps_colors.dart';

class CategoryDropDownWidget extends StatelessWidget {
  const CategoryDropDownWidget({
    super.key,
    required this.margin,
    this.isAll = true,
  });

  final double margin;
  final bool? isAll;

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.put(CategoryController());
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondaryColor),
        width: mq.width,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
              border: InputBorder.none),
          borderRadius: BorderRadius.circular(15),
          hint: const Text("Select Tour Category"),
          value: isAll!
              ? categoryController.allSelectedCategory.value
              : categoryController.selectedCategory.value,
          items: isAll!
              ? categoryController.allCategories.map(
                  (category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  },
                ).toList()
              : categoryController.categories.map(
                  (category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  },
                ).toList(),
          onChanged: (value) {
            isAll!
                ? categoryController.setAllCategory(category: value.toString())
                : categoryController.setCategory(category: value.toString());
          },
        ),
      ),
    );
  }
}

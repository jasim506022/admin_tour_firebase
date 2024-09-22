
import 'package:bd_tour_firebase_admin/data/response/app_exception.dart';
import 'package:bd_tour_firebase_admin/repository/tour_repository.dart';
import 'package:bd_tour_firebase_admin/res/apps_function.dart';
import 'package:bd_tour_firebase_admin/res/string_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../res/constant.dart';
import 'category_controller.dart';

class TourController extends GetxController {
  var categoryController = Get.find<CategoryController>();
  final TourRepository repository;

  var currentPhotoIndex = 0.obs;

  Map<String, double> categoryDataMap = {};
  Map<String, double> categoryActiveDataMap = {};

  TourController({required this.repository});

  void changeImage(int index) {
    currentPhotoIndex.value = index;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot(
      {required BuildContext context, String? all }) {
    try {
      return repository.tourSnapshot(
          category: all?? categoryController.allSelectedCategory.value);
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
      rethrow;
    }
  }

  void updateCategoryData(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    convertListToMap();

    for (var doc in docs) {
      String category = doc['category'];
      bool isActive = doc['isActive'];

      if (categoryDataMap.containsKey(category)) {
        categoryDataMap[category] = categoryDataMap[category]! + 1;
      }
      if (isActive && categoryActiveDataMap.containsKey(category)) {
        categoryActiveDataMap[category] = categoryActiveDataMap[category]! + 1;
      }
    }

    update();
  }

  void convertListToMap() {
    var categoryList =
    ConstantData.   sharedPreference!.getStringList(StringConstant.categoriesSharePre);
    if (categoryList != null) {
      categoryDataMap = {for (var category in categoryList) category: 0.0};
      categoryActiveDataMap = {
        for (var category in categoryList) category: 0.0
      };
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> popularSnapshot(
      BuildContext context) {
    try {
      return repository.popularSnapshot();
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> singleTourSnapshot(
      {required String id, required BuildContext context}) {
    try {
      return repository.singleTourSnapshot(id: id);
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
      rethrow;
    }
  }

  Future<void> deleteTour(
      {required String id, required BuildContext context}) async {
    try {
      repository.deleteTour(id: id);
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
    }
  }
}

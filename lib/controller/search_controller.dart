
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/tour_model.dart';

class SearchControllers extends GetxController {

  TextEditingController searchTextTEC = TextEditingController();

  var searchList = <TourModel>[].obs;

  var allTours = <TourModel>[].obs;

  var isSearchList = false.obs;

  void searchAddProduct({required TourModel tourModel}) {
    searchList.add(tourModel);
  }


}

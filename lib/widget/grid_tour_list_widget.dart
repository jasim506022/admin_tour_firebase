import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controller/search_controller.dart';
import '../model/tour_model.dart';
import '../page/tour/widget/tour_widget.dart';
import '../res/constant.dart';
import 'error_widget.dart';
import 'responsive.dart';

class GridTourListWidget extends StatelessWidget {
  const GridTourListWidget({
    this.snapshot,
    this.isSearch = false,
    super.key,
    this.searchController,
  });

  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>? snapshot;
  final bool? isSearch;
  final SearchControllers? searchController;

  @override
  Widget build(BuildContext context) {
    if (isSearch!) {
      return Obx(
        () => buildGridView(context),
      );
    } else {
      return buildGridView(context);
    }
  }

  Widget buildGridView(BuildContext context) {
    var tours = getTourList();
    if (tours.isEmpty) {
      return const FirebaseErrorWidget(
        title: "No Tours Available. Nothing to display at this time.",
      );
    }
    return GridView.builder(
      itemCount: tours.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
          childAspectRatio: Responsive.isMobile(context)
              ? ConstantData.mq.width < 500 && ConstantData.mq.width < 600
                  ? 2
                  : 0.77
              : .77),
      itemBuilder: (context, index) {
        TourModel tourModel = tours[index];
        return ChangeNotifierProvider.value(
            value: tourModel, child: TourWidget(index: index));
      },
    );
  }

  List<TourModel> getTourList() {
    if (isSearch!) {
      if (searchController!.isSearch.value &&
          searchController!.searchTourTextTEC.text.isNotEmpty) {
        return searchController!.searchTourList;
      }
      return searchController!.allTourList;
    } else {
      return snapshot!.data!.docs
          .map((doc) => TourModel.fromMap(doc.data()))
          .toList();
    }
  }
}

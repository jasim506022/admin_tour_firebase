
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../controller/search_controller.dart';
import '../model/tour_model.dart';
import '../page/tour/widget/tour_widget.dart';
import '../res/constant.dart';
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
    return GridView.builder(
      itemCount: isSearch!
          ? snapshot!.data!.docs.length
          : searchController!.isSearch.value &&
          searchController!.searchTourTextTEC.text.isNotEmpty
          ? searchController!.searchTourList.length
          : searchController!.allTourList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
          childAspectRatio: Responsive.isMobile(context)
              ?ConstantData. mq.width < 500 && ConstantData. mq.width < 600
              ? 2
              : 0.8
              : .8),
      itemBuilder: (context, index) {
        TourModel tourModel = isSearch!
            ? TourModel.fromMap(snapshot!.data!.docs[index].data())
            : searchController!.isSearch.value &&
            searchController!.searchTourTextTEC.text.isNotEmpty
            ? searchController!.searchTourList[index]
            : searchController!.allTourList[index];
        return ChangeNotifierProvider.value(
            value: tourModel, child: TourWidget(index: index));
      },
    );
  }
}

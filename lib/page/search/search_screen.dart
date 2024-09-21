import 'package:bd_tour_firebase_admin/controller/search_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../const/const.dart';
import '../../controller/tour_controller.dart';
import '../../model/tour_model.dart';
import '../../res/apps_colors.dart';
import '../../res/constant.dart';
import '../../widget/category_drop_down_widget.dart';
import '../../widget/responsive.dart';
import '../tour/widget/error_widget.dart';
import '../tour/widget/loading_tour_list_widget.dart';
import '../tour/widget/tour_widget.dart';

class SearchTourScreen extends StatelessWidget {
  const SearchTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tourController = Get.find<TourController>();
    var searchController = Get.put(SearchControllers());
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: ConstantData.defaultPadding,
              horizontal: ConstantData.defaultPadding),
          child: TextFormField(
            controller: searchController.searchTextTEC,
            onChanged: (text) {
              searchController.searchList.clear();
              var searchText = text.toLowerCase();

              for (var tourModel in searchController.allTours) {
                if (tourModel.name!.toLowerCase().contains(searchText)) {
                  searchController.searchAddProduct(tourModel: tourModel);
                }
              }
              searchController.isSearchList.value = true;
            },
            decoration: InputDecoration(
                hintText: "Search Here",
                hintStyle: const TextStyle(color: Colors.white60),
                fillColor: AppColors.secondaryColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greenColor, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                // fillColor: AppColors.secondaryColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greenColor, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greenColor, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                )),
          ),
        ),
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
                  searchController.allTours.value = snapshot.data!.docs
                      .map(
                        (e) => TourModel.fromMap(e.data()),
                      )
                      .toList();
                  return _buildTourGrid(snapshot, context, searchController);
                }
                return const LoadingTourWidgetList();
              },
            ),
          ),
        ),
      ],
    ));
  }

  bool _productMatchesSearch(TourModel product, String searchText) {
    return product.name!.toLowerCase().contains(searchText);
  }

  _buildTourGrid(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      BuildContext context, SearchControllers searchController) {
    return Obx(
      () => GridView.builder(
        itemCount: searchController.isSearchList.value &&
                searchController.searchTextTEC.text.isNotEmpty
            ? searchController.searchList.length
            : searchController.allTours.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
            childAspectRatio: Responsive.isMobile(context)
                ? mq.width < 500 && mq.width < 600
                    ? 2
                    : 0.8
                : .76),
        itemBuilder: (context, index) {
          TourModel tourModel = searchController.isSearchList.value &&
                  searchController.searchTextTEC.text.isNotEmpty
              ? searchController.searchList[index]
              : searchController.allTours[index];
          return ChangeNotifierProvider.value(
              value: tourModel, child: TourWidget(index: index));
        },
      ),
    );
  }
}

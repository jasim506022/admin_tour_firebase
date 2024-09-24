import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/search_controller.dart';
import '../../model/tour_model.dart';
import '../../res/constant.dart';
import '../../widget/category_drop_down_widget.dart';
import '../../widget/grid_tour_list_widget.dart';
import '../../widget/error_widget.dart';
import '../../widget/loading_tour_list_widget.dart';
import '../../widget/search_widget_text_field.dart';

class SearchTourScreen extends StatelessWidget {
  const SearchTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = Get.put(SearchControllers());
    return Scaffold(
        body: Column(
      children: [
        SearchWidgetTextField(
          controller: searchController.searchTourTextTEC,
          hint: "Search Tour",
          onChanged: (text) {
            searchController.filterUser(text);
          },
        ),
        const SizedBox(
          height: ConstantData.defaultPadding,
        ),
        CategoryDropDownWidget(
          isSearch: true,
          margin: ConstantData.defaultPadding,
          onchange: (category) {
            searchController.filterByCategory(category!);
            searchController.searchTourTextTEC.text = "";
            searchController.allTourList.value = [];
            searchController.searchTourList.value = [];
            searchController.isSearch.value = false;
          },
        ),
        const SizedBox(
          height: ConstantData.defaultPadding,
        ),
        Expanded(
          child: Obx(
            () => StreamBuilder(
              stream: searchController.tourController
                  .tourSnapshot(context: context),
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
                  searchController.allTourList.value = snapshot.data!.docs
                      .map(
                        (e) => TourModel.fromMap(e.data()),
                      )
                      .toList();
                  return GridTourListWidget(
                    searchController: searchController,
                    isSearch: true,
                  );
                }
                return const LoadingTourWidgetList();
              },
            ),
          ),
        ),
      ],
    ));
  }
}

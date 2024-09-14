import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../controller/main_page_controller.dart';
import '../../../res/constant.dart';
import '../loading/loading_summery_widget.dart';
import 'summery_widget.dart';

class SummeryGridView extends StatelessWidget {
  const SummeryGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    var mainController = Get.find<MainPageController>();
    return GridView.builder(
        itemCount: collections.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: ConstantData.defaultPadding,
            mainAxisSpacing: ConstantData.defaultPadding,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) => StreamBuilder(
              stream: mainController.summerySnapshot(
                  collection: collections[index], context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingSummeryWidget();
                }

                if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                }
                if (snapshot.hasData) {
                  var totalCount = snapshot.data!.docs.length;
                  var activeCount = snapshot.data!.docs
                      .where(
                        (element) => element["isActive"] == true,
                      )
                      .length;

                  double percentage =
                      totalCount == 0 ? 0 : (activeCount / totalCount) * 100;
                  return SummeryWidget(
                    activeCount: activeCount,
                    percentage: percentage,
                    totalCount: totalCount,
                    title: collections[index],
                    index: index,
                  );
                }
                return const LoadingSummeryWidget();
              },
            ));
  }
}

final List<String> collections = ['tours', 'user'];

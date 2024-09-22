import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';


import '../../../controller/tour_controller.dart';
import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';
import 'tour_category_card_widget.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourController = Get.find<TourController>();
    return Container(
      padding: const EdgeInsets.all(ConstantData.defaultPadding),
      decoration:  BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Tour Category Details",
            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: ConstantData.defaultPadding),
          StreamBuilder(
            stream: tourController.tourSnapshot(context: context, all: "All"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              if (snapshot.hasData) {
                tourController.updateCategoryData(snapshot.data!.docs);

                return Column(
                  children: [
                    _pieChartMethod(dataMap: tourController.categoryDataMap),
                    ListView(
                      shrinkWrap: true,
                      children:
                          tourController.categoryDataMap.keys.map((category) {
                        return TourCategoryCard(
                          category: category,
                          activeTours: tourController
                              .categoryActiveDataMap[category]!
                              .toInt(),
                          totalTours:
                              tourController.categoryDataMap[category]!.toInt(),
                        );
                      }).toList(),
                    )
                  ],
                );
              }
              return const Center(child: Text("No data available"));
            },
          ),
        ],
      ),
    );
  }

  SizedBox _pieChartMethod({required Map<String, double> dataMap}) {
    return SizedBox(
      height: 200, // Adjust the height of the chart as needed
      child: PieChart(

        chartValuesOptions:  ChartValuesOptions(
          chartValueStyle: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        legendOptions: LegendOptions(
          showLegends: true,
          legendTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        chartType: ChartType.disc,
        dataMap: dataMap,
      ),
    );
  }
}

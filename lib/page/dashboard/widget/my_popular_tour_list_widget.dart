import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../../controller/tour_controller.dart';

import '../../../model/tour_model.dart';
import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';

class MyPopularTourWidget extends StatelessWidget {
  const MyPopularTourWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourController = Get.find<TourController>();
    return Container(
      padding: const EdgeInsets.all(ConstantData.defaultPadding),
      decoration:  BoxDecoration(
          color:AppColors. secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Tours ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                width: double.infinity,
                child: StreamBuilder(
                  stream: tourController.popularSnapshot(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }
                    if (snapshot.hasData) {
                      var documents = snapshot.data!.docs;
                      List<DataRow> rows = documents.map((doc) {
                        var tourModel = TourModel.fromMap(doc.data());
                        return _buildDataRow(tourModel);
                      }).toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          child: DataTable(
                            dataRowMaxHeight: 60,
                            headingRowHeight: 40,
                            dataTextStyle: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                            headingTextStyle: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            columns: columns,
                            rows: rows,
                          ),
                        ),
                      );
                    }
                    return const Center(child: Text("No data available"));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  DataRow _buildDataRow(TourModel tourModel) {
    return DataRow(cells: [
      DataCell(Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.white, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            tourModel.imageList![0],
            width: 60,
            height: 40, fit: BoxFit.fill,
          ),
        ),
      )),
      DataCell(
          Text(tourModel.name!, maxLines: 2, overflow: TextOverflow.ellipsis)),
      DataCell(SizedBox(width: 50, child: Text(tourModel.price!.toString()))),
      DataCell(Text(tourModel.address!,
          maxLines: 2, overflow: TextOverflow.ellipsis)),
    ]);
  }
}

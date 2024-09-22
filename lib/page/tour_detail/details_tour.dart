import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/tour_controller.dart';
import '../../model/tour_model.dart';
import '../../res/apps_colors.dart';
import '../../res/constant.dart';

class DetailsTourWidget extends StatelessWidget {
  const DetailsTourWidget({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    var tourController = Get.find<TourController>();
    return Scaffold(
        body: FutureBuilder(
      future: tourController.singleTourSnapshot(id: id, context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error fetching tour details"));
        }
        if (snapshot.hasData) {
          var data = snapshot.data!.data();

          if (data != null) {
            var tourModel = TourModel.fromMap(data);

            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildImageSection(tourModel),
                  Column(
                    children: [
                      _buildShapeBackgroundOfWidget(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Price: ${tourModel.price}",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildShapeBackgroundOfWidget(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Location: ${tourModel.address}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildShapeBackgroundOfWidget(
                        child: Text(
                          tourModel.details!,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }

  SizedBox _buildImageSection(TourModel tourModel) {
    return SizedBox(
      width: ConstantData.mq.width,
      height:ConstantData. mq.height,
      child: Stack(
        children: [
          Stack(
            children: [
              _buildBackgroundImage(tourModel),
              _buildOverlay(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopInformation(tourModel),
                  _buildThumbnailSection(tourModel),
                ],
              ),
            ],
          ),

          _buildCategoryRatingWidget(tourModel),

          // Positioned content below the image
        ],
      ),
    );
  }

  Positioned _buildCategoryRatingWidget(TourModel tourModel) {
    return Positioned(
      top:ConstantData. mq.height * 0.82,
      right: 0,
      left: 0,
      child: _buildShapeBackgroundOfWidget(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category: ${tourModel.category}",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Ratting: ${tourModel.ratting}",
                  style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildShapeBackgroundOfWidget(
      {required Widget child, double? height}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          height: height,
          width:ConstantData. mq.width,
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: child),
    );
  }

  Expanded _buildThumbnailSection(TourModel tourModel) {
    var tourController = Get.find<TourController>();
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(
          horizontal:ConstantData. mq.width * .08, vertical: ConstantData.mq.width * .05),
      height: 400,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Obx(
        () => Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                tourModel.imageList![tourController.currentPhotoIndex.value],
                height: 325,
                width:ConstantData. mq.width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: 45,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: tourModel.imageList!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      tourController.changeImage(index);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: tourController.currentPhotoIndex.value ==
                                        index
                                    ? 3
                                    : 1,
                                color: tourController.currentPhotoIndex.value ==
                                        index
                                    ? Colors.yellow
                                    : AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            tourModel.imageList![index],
                            fit: BoxFit.fill,
                            height: 40,
                            width: 80,
                          ),
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  Expanded _buildTopInformation(TourModel tourModel) {
    return Expanded(
        child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:ConstantData. mq.width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tourModel.name!,
              style: GoogleFonts.alfaSlabOne(
                  letterSpacing: 2.5,
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              tourModel.details!,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ));
  }

  Container _buildOverlay() {
    return Container(
      width: ConstantData.mq.width,
      height: ConstantData.mq.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }

  Widget _buildBackgroundImage(TourModel tourModel) {
    var tourController = Get.find<TourController>();
    return Obx(
      () => Container(
        width: ConstantData.mq.width,
        height: ConstantData.mq.height * 0.9,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              tourModel.imageList![tourController.currentPhotoIndex.value]),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}

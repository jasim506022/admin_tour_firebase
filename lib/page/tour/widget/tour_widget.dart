import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../../../controller/main_page_controller.dart';
import '../../../controller/tour_controller.dart';
import '../../../model/menu_model.dart';
import '../../../model/tour_model.dart';
import '../../../res/apps_colors.dart';
import '../../../res/apps_function.dart';
import '../../../res/constant.dart';

import '../../../res/string_constant.dart';
import '../../../widget/confirmation_dialog.dart';
import '../../../widget/custom_button_widget.dart';
import '../../../widget/responsive.dart';

class TourWidget extends StatelessWidget {
  const TourWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final tourModel = Provider.of<TourModel>(context);
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(ConstantData.defaultPadding),
      color: AppColors.tourCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          context.go('/details/${tourModel.id}');
        },
        child: Container(
          margin: const EdgeInsets.all(ConstantData.defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ConstantData.defaultPadding)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageClipRRect(tourModel, context),
              const SizedBox(
                height: ConstantData.defaultPadding,
              ),
              _buildTitleRow(tourModel),
              const SizedBox(
                height: 8,
              ),
              Text(
                tourModel.address!,
                style: TextStyle(
                    color: AppColors.white.withOpacity(0.7), fontSize: 13),
              ),
              const SizedBox(height: ConstantData.defaultPadding),
              if (Responsive.isDesktop(context))
                Text(
                  tourModel.details!,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 13,
                  ),
                ),
              const SizedBox(
                height: ConstantData.defaultPadding,
              ),
              Divider(
                height: 1,
                color: AppColors.white.withOpacity(0.6),
              ),
              const SizedBox(height: ConstantData.defaultPadding),
              _buildActionButton(context, tourModel),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildActionButton(BuildContext context, TourModel tourModel) {
    var tourController = Get.find<TourController>();
    var mainController = Get.find<MainPageController>();
    return Row(
      children: [
        Expanded(
          child: CustomButtonWidget(
            verticalPadding: 18,
            function: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ConfirmationDialog(
                    title: "Are you sure you want to delete this tour?",
                    subtitle:
                        "This will delete this tour Permanently. You cannot undo this action",
                    onPress: () {
                      tourController.deleteTour(
                          id: tourModel.id!, context: context);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            title: "Delete",
            backgroundColor: AppColors.red,
            borderColor: AppColors.red,
            textColor: AppColors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomButtonWidget(
            verticalPadding: 18,
            function: () {
              var data = {
                StringConstant.isUpdate: true,
                StringConstant.tourModel: tourModel
              };
              AppsFunction.navigatorChange(
                  context, mainController, SidebarItem.addTourScreen,
                  isExtra: true, extra: data);
            },
            backgroundColor: AppColors.tourCardColor,
            title: "Edit",
            borderColor: AppColors.deepGreen,
            textColor: AppColors.white,
          ),
        ),
      ],
    );
  }

  Row _buildTitleRow(TourModel tourModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: ConstantData.defaultPadding, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.deepGreen,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: Text(
              "${index + 1}",
              style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            tourModel.name!,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w800,
            ),
            softWrap: true,

            maxLines: 2,

            overflow: TextOverflow
                .ellipsis, // Adds ... if text is longer than maxLines
          ),
        ),
      ],
    );
  }

  ClipRRect _imageClipRRect(TourModel tourModel, BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: FancyShimmerImage(
          imageUrl: tourModel.imageList![0],
          width: ConstantData.mq.width,
          height:
              Responsive.isMobile(context) ? ConstantData.mq.height * .23 : ConstantData.mq.height * .3,
          boxFit: BoxFit.fill,
        ));
  }
}

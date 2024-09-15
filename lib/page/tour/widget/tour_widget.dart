import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../../controller/tour_controller.dart';
import '../../../model/tour_model.dart';
import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';
import '../../../res/routes/routes_name.dart';
import '../../../res/string_constant.dart';
import '../../../widget/delete_dialog_widget.dart';
import '../../../widget/responsive.dart';
import 'custom_button_widget.dart';

class TourWidget extends StatelessWidget {
  const TourWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    var tourController = Get.find<TourController>();
    final tourModel = Provider.of<TourModel>(context);
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(ConstantData.defaultPadding),
      color: AppColors.tourCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          context.go('/details/${tourModel.id
          }');
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageClipRRect(tourModel, context),
              const SizedBox(
                height: 20,
              ),
              _buildTitleRow(tourModel),
              const SizedBox(
                height: 5,
              ),
              Text(
                tourModel.address!,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: ConstantData.defaultPadding),
              if (Responsive.isDesktop(context))
                Text(
                  tourModel.details!,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              const SizedBox(
                height: ConstantData.defaultPadding,
              ),
              const Divider(
                height: 1,
                color: Colors.white60,
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
    return Row(
      children: [
        Expanded(
          child: CustomButtonTourWidget(
            function: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogDeleteTourWidget(
                      // tourController: tourController,
                      tourModel: tourModel);
                },
              );
            },
            backgroundColor: AppColors.red,
            title: "Delete",
            borderColor: AppColors.red,
            textColor: AppColors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomButtonTourWidget(
            function: () {
              var data = {
                StringConstant.isUpdate: true,
                StringConstant.tourModel: tourModel
              };
              context.goNamed(RoutesName.addTourScreen, extra: data);
            },
            backgroundColor: AppColors.tourCardColor,
            title: "Edit",
            borderColor: AppColors.deepGreen,
            textColor: Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.deepGreen,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  color: Colors.white,
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
            style: const TextStyle(
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
          width: MediaQuery.of(context).size.width,
          height:
              Responsive.isMobile(context) ? mq.height * .23 : mq.height * .3,
          boxFit: BoxFit.fill,
        ));
  }
}

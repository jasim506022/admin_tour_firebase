
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const/const.dart';
import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';

class LoadingTourWidget extends StatelessWidget {
  const LoadingTourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(20),
      color: AppColors.tourCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shimmer for the image placeholder
              _buildShimmer(
                width: mq.width,
                height: mq.height * .3,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildShimmer(
                    height: 20,
                    width: 45,
                  ),
                  const SizedBox(
                    width: ConstantData.defaultPadding,
                  ),
                  Expanded(
                    child: _buildShimmer(
                      height: ConstantData.defaultPadding,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              _buildShimmer(
                height: 10,
                width: 100,
              ),
              const SizedBox(height: 20),
              _buildShimmer(
                height: ConstantData.defaultPadding,
              ),
              const SizedBox(
                height: 10,
              ),
              _buildShimmer(
                height: ConstantData.defaultPadding,
              ),
              const SizedBox(
                height: 10,
              ),
              _buildShimmer(
                height: ConstantData.defaultPadding,
              ),
              const SizedBox(height: ConstantData.defaultPadding),

              _buildShimmer(
                height: 12,
              ),
              const SizedBox(
                height: ConstantData.defaultPadding,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildShimmer(
                      height: 40,
                      width: 100,
                      // color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildShimmer(
                      height: 40,
                      width: 100,
                      // color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildShimmer({double? width, required double height}) {
    return Container(
      width: width ?? mq.width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.grey.shade300),
    );
  }
}

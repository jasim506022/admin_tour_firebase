import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const/const.dart';
import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';

class LoadingSummeryWidget extends StatelessWidget {
  const LoadingSummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ConstantData.defaultPadding),
      decoration:  BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(ConstantData.defaultPadding * 0.75),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300),
            ),
            _buildLineShimmer(),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300.withOpacity(.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                ),
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * 80 / 100,
                    // i want to show active percentage
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: _buildLineShimmer(),
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: _buildLineShimmer(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildLineShimmer() {
    return Container(
      height: 10,
      width: mq.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.grey.shade300),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../model/summer_model.dart';
import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({
    super.key,
    required this.index,
    required this.title,
    required this.activeCount,
    required this.totalCount,
    required this.percentage,
  });

  final int index;
  final String title;
  final int activeCount;
  final int totalCount;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ConstantData.defaultPadding),
      decoration:  BoxDecoration(
          color:AppColors. secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(ConstantData.defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: summerList[index].color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(child: Icon(summerList[index].icon!)),
              ),
              const Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          Text(
            // summerList[index].title!,
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                    color: summerList[index].color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth * percentage / 100,
                  // i want to show active percentage
                  height: 5,
                  decoration: BoxDecoration(
                      color: summerList[index].color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Active: $activeCount",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white70),
                ),
              ),
              Flexible(
                child: Text(
                  "Total $totalCount",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


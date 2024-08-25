
import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../dashboard_screen.dart';

class FileWidget extends StatelessWidget {
  const FileWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: demoMyFiles[index].color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Icon(demoMyFiles[index].icon!),
              ),
              const Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          Text(
            demoMyFiles[index].title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                    color: demoMyFiles[index].color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth *
                      (demoMyFiles[index].percentage! / 100),
                  height: 5,
                  decoration: BoxDecoration(
                      color: demoMyFiles[index].color,
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
                  "${demoMyFiles[index].numOfFiles} Files",
                  overflow: TextOverflow.ellipsis,
                  // Adds "..." if text is too long
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white70),
                ),
              ),
              Flexible(
                child: Text(
                  demoMyFiles[index].totalStorage!,
                  overflow: TextOverflow.ellipsis,
                  // Adds "..." if text is too long
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


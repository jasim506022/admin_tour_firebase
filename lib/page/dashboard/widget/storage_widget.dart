
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../const/const.dart';

class StorageWidget extends StatelessWidget {
  const StorageWidget({
    super.key,
    required this.dataMap,
  });

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Storage Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
              height: 200,
              child: PieChart(

                chartType: ChartType.disc,
                dataMap: dataMap,
              )),
          Container(
            margin: const EdgeInsets.only(top: defaultPadding),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: primaryColor.withOpacity(0.15),
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(defaultPadding))),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 20,
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "15 Files",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text("15 GB")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: defaultPadding),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: primaryColor.withOpacity(0.15),
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(defaultPadding))),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 20,
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "15 Files",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text("15 GB")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: defaultPadding),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: primaryColor.withOpacity(0.15),
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(defaultPadding))),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 20,
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "15 Files",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text("15 GB")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: defaultPadding),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: primaryColor.withOpacity(0.15),
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(defaultPadding))),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 20,
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "15 Files",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text("15 GB")
              ],
            ),
          )
        ],
      ),
    );
  }
}


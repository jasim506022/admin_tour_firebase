import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../dashboard_screen.dart';

class MyRecentWidget extends StatelessWidget {
  const MyRecentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius:
          BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Text(
              "Recent Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                  columnSpacing: defaultPadding,
                  columns: const [
                    DataColumn(
                      label: Text("File Name"),
                    ),
                    DataColumn(
                      label: Text("Date"),
                    ),
                    DataColumn(
                      label: Text("Size"),
                    ),
                  ],
                  rows: List.generate(
                      demoRecentFiles.length,
                          (index) => DataRow(cells: [
                        DataCell(
                          Row(
                            children: [
                              Icon(
                                demoRecentFiles[index].icon,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets
                                    .symmetric(
                                    horizontal:
                                    defaultPadding),
                                child: Text(
                                    demoRecentFiles[index]
                                        .title!),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(
                            demoRecentFiles[index].date!)),
                        DataCell(Text(
                            demoRecentFiles[index].size!)),
                      ]))),
            )
          ],)
        ],
      ),
    );
  }
}
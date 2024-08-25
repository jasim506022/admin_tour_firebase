import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../dashboard_screen.dart';
import 'file_widget.dart';

class FileGridView extends StatelessWidget {
  const FileGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: demoMyFiles.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => FileWidget(
        index: index,
      ),
    );
  }
}
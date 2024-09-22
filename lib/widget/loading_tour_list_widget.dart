import 'package:flutter/material.dart';

import 'loading_tour_widget.dart';

class LoadingTourWidgetList extends StatelessWidget {
  const LoadingTourWidgetList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: .76),
      itemBuilder: (context, index) {
        return const LoadingTourWidget();
      },
    );
  }
}
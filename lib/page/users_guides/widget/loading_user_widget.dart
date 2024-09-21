import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../res/apps_function.dart';

class LoadingPersonWidget extends StatelessWidget {
  const LoadingPersonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Row(
                children: [
                  AppsFunction.shimmerEffect(height: 50, width: 50),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppsFunction.shimmerEffect(height: 8),
                        AppsFunction.shimmerEffect(height: 8),
                        AppsFunction.shimmerEffect(height: 8),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

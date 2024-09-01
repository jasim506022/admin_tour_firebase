import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingTourWidget extends StatelessWidget {
  const LoadingTourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(20),
      color: const Color(0xFF2F3143),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer for the image placeholder
            ShimmerPlaceHolder(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ShimmerPlaceHolder(
                  height: 20,
                  width: 45,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ShimmerPlaceHolder(
                    width: MediaQuery.of(context).size.width,
                    height: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const ShimmerPlaceHolder(
              height: 10,
              width: 100,
            ),
            const SizedBox(height: 20),
            ShimmerPlaceHolder(
              height: 18,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 10,
            ),
            ShimmerPlaceHolder(
              height: 18,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 10,
            ),
            ShimmerPlaceHolder(
              height: 18,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 15),

            ShimmerPlaceHolder(
              height: 12,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: ShimmerPlaceHolder(
                    height: 40,
                    width: 100,
                    // color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ShimmerPlaceHolder(
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
    );
  }
}

class ShimmerPlaceHolder extends StatelessWidget {
  const ShimmerPlaceHolder(
      {super.key, required this.width, required this.height});

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300),
      ),
    );
  }
}
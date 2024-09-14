import 'package:flutter/material.dart';

class TourCategoryCard extends StatelessWidget {
  final String category;
  final int activeTours;
  final int totalTours;

  const TourCategoryCard({
    super.key,
    required this.category,
    required this.activeTours,
    required this.totalTours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.blue.withOpacity(0.15), // Replace with primaryColor
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.category, // Customize the icon
            size: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Active Tours: $activeTours",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Text("Total Tours: $totalTours")
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DynamicHeightHorizontalList extends StatelessWidget {
  final List<double>
      aspectRatios; // Aspect ratios for each item (width / height)

  DynamicHeightHorizontalList({required this.aspectRatios});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Fixed height for the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: aspectRatios.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            child: AspectRatio(
              aspectRatio: aspectRatios[index], // Maintain dynamic aspect ratio
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors
                      .primaries[index % Colors.primaries.length].shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Item ${index + 1}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DynamicHeightHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Reduced height for a sleeker design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(16),
            width: 100, // Reduced width for compact items
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length].shade200,
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
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StreakCard extends StatelessWidget {
  final double aspectRatio;

  StreakCard(
      {required this.aspectRatio}); // Accept aspect ratio from the backend

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio, // Maintain aspect ratio from backend
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.local_fire_department, color: Colors.red, size: 40),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Save the streak 🔥',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '10-Day Savings Challenge',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

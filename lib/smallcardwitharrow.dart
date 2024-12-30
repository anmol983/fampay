import 'package:flutter/material.dart';

class SmallCardWithArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Colors.black),
              SizedBox(width: 8),
              Text(
                'Small card with arrow',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Icon(Icons.arrow_forward, color: Colors.black),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SmallDisplayCard extends StatelessWidget {
  final bool isScrollable;

  const SmallDisplayCard({Key? key, required this.isScrollable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200, // Background color to match the design
      padding:
          const EdgeInsets.symmetric(vertical: 16), // Top and bottom padding
      child: isScrollable
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16), // Add padding on the left
                  _buildCard(isScrollable: true),
                  SizedBox(width: 16),
                  _buildCardWithArrow(isScrollable: true),
                  SizedBox(width: 16), // Add padding on the right
                ],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCard(isScrollable: false),
                _buildCardWithArrow(isScrollable: false),
              ],
            ),
    );
  }

  Widget _buildCard({required bool isScrollable}) {
    return Container(
      width: isScrollable
          ? null
          : 160, // Stretch in scrollable mode, fixed otherwise
      constraints: BoxConstraints(
        minWidth: 160, // Ensure a minimum width
        maxWidth: isScrollable
            ? 200
            : 160, // Stretchable max width in scrollable mode
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.person, size: 32, color: Colors.black),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Small card',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              overflow: TextOverflow.ellipsis, // Handle long text gracefully
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWithArrow({required bool isScrollable}) {
    return Container(
      width: isScrollable
          ? null
          : 160, // Stretch in scrollable mode, fixed otherwise
      constraints: BoxConstraints(
        minWidth: 160, // Ensure a minimum width
        maxWidth: isScrollable
            ? 200
            : 160, // Stretchable max width in scrollable mode
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/arya_stark.jpg'),
            radius: 20,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Small card',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  'Arya Stark',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward, size: 16, color: Colors.black),
        ],
      ),
    );
  }
}

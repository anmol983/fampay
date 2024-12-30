import 'package:fampay/bigdisplaycard.dart';
import 'package:fampay/dynamiccard.dart';
import 'package:fampay/smallcardwitharrow.dart';
import 'package:fampay/smallcardwithdisplay.dart';

import 'package:fampay/streakcard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'fampay',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Icon(Icons.flight, size: 18),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigDisplayCard(),
              SizedBox(height: 16),
              SmallCardWithArrow(),
              SizedBox(height: 16),
              StreakCard(),
              SizedBox(height: 16),
              DynamicHeightHorizontalList(),
              SizedBox(height: 16),
              SmallDisplayCard(),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

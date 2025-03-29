import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streaks & Rewards Page'),
      ),
      body: Center(
        child: Text(
          'Streaks and badges for consistency',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
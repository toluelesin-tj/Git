import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Page'),
      ),
      body: Center(
        child: Text(
          'Graphs & stats on workouts (e.g., total workouts, personal bests).',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
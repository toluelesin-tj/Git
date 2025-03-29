import 'package:flutter/material.dart';

class WorkoutHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Workouts'),
      ),
      body: Center(
        child: Text(
          'View all past workouts',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

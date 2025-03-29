import 'package:flutter/material.dart';

class LogWorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Workout'),
      ),
      body: Center(
        child: Text(
          'Add new workouts (exercise name, sets, reps, weight, etc.).',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

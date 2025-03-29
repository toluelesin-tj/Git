import 'package:flutter/material.dart';
import 'log_workout_page.dart';
import 'workout_history_page.dart';
import 'progress_page.dart';
import 'profile_page.dart';
import 'challenges_page.dart';
import 'streaks_rewards_page.dart';

void main() {
  runApp(MyApp()); // Starts the app
}

// Main app widget
class MyApp extends StatelessWidget { // Defines new app that represents the whole app. It doesn't change when built 
  @override
  Widget build(BuildContext context) { // modifying the build method from StatelessWidget using override and this build method creates the UI for the project
    return MaterialApp( // root widget of your app
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: WorkoutHomePage(), // Sets the home screen
    );
  }
}

// The home page of the gym app
class WorkoutHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogWorkoutPage()),
              );
            },
            child: Text('Log Workout'),
          ),
          SizedBox(height: 20), // Adds spacing between buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutHistoryPage()),
              );
            },
            child: Text('Workout History'),
          ),
          SizedBox(height: 20), // Adds spacing between buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressPage()),
              );
            },
            child: Text('Progress'),
          ),
          SizedBox(height: 20), // Adds spacing between buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Text('Your Profile Page'),
          ),
          SizedBox(height: 20), // Adds spacing between buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChallengesPage()),
              );
            },
            child: Text('Go to Challenges Page'),
          ),
          SizedBox(height: 20), // Adds spacing between buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RewardsPage()),
              );
            },
            child: Text('Streaks & Rewards Page'),
          ),
        ],
      ),
    );
  }
}
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
    return MaterialApp( // root widget of app
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF4F9FF),
          primaryColor: Color(0xFF4A90E2),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF4A90E2),
            primary: Color(0xFF4A90E2),
            secondary: Color(0xFF7FB3FF),
            background: Color(0xFFF4F9FF),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Color(0xFF1E2A38)),  // rich navy-gray
            bodyMedium: TextStyle(color: Color(0xFF1E2A38)),
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E2A38),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(color: Color(0xFF5C6B84)),  // friendlier gray-blue
            hintStyle: TextStyle(color: Color(0xFF5C6B84)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4A90E2),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14),
              textStyle: TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Color(0xFF4A90E2),
            contentTextStyle: TextStyle(color: Colors.white),
          ),
        ),
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
          BigActionButton(
            text: '📝 Log Workout',
            icon: Icons.fitness_center,
            onPressed: () {
              // Navigate or do something
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogWorkoutPage()),
              );
            },
          ),
          SizedBox(height: 20), // Adds spacing between buttons
          BigActionButton(
            text: '📜 Workout History',
            icon: Icons.history,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutHistoryPage()),
              );
            },
            ),

          SizedBox(height: 20), // Adds spacing between buttons
          BigActionButton(
            text: 'Progress Page',
            icon: Icons.arrow_upward,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressPage()),
              );
            },
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

// Reusable button widget

class BigActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const BigActionButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}


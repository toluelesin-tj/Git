import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Page'),
      ),
      body: Center(
        child: Text(
          'User settings, streaks, badges and references',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
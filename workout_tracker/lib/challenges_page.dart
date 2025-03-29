import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges Page'),
      ),
      body: Center(
        child: Text(
          'Set and complete challenges',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
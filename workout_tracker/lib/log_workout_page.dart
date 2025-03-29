import 'package:flutter/material.dart'; //uses Flutter's material design widgets

// Add the main widget class for the Log Workout Page. Make it dynamic using StatefulWidget
class LogWorkoutPage extends StatefulWidget {
  @override
  _LogWorkoutPageState createState() => _LogWorkoutPageState();
}

// This holds the state for the page aka what variables to add etc so that this holds the data entered by the user
class _LogWorkoutPageState extends State<LogWorkoutPage> {
  // Variables to store the input data
  String _workoutType = '';
  double _duration = 0;
  String _intensity = 'Low';
  int _caloriesBurned = 0;
  String _notes = '';
  
  // override the initial varriables to give them functionality here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new workouts (exercise name, sets, reps, weight, etc.).'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWorkoutTypeSelection(),
            _buildDurationInput(),
            _buildIntensitySelection(),
            _buildCaloriesBurnedInput(),
            _buildNotesInput(),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  // Widget for selecting workout type
  Widget _buildWorkoutTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Workout Type:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: _workoutType.isEmpty ? null : _workoutType,
          hint: Text('Select workout type'),
          onChanged: (String? newValue) {
            setState(() {
              _workoutType = newValue!;
            });
          },
          items: <String>['Cardio', 'Strength', 'CrossFit', 'Powerlifiting', 'Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Widget for inputting workout duration
  Widget _buildDurationInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Duration (minutes):', style: TextStyle(fontSize: 16)),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Enter duration in minutes'),
          onChanged: (value) {
            setState(() {
              _duration = double.tryParse(value) ?? 0;
            });
          },
        ),
      ],
    );
  }

  // Widget for selecting intensity level
  Widget _buildIntensitySelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Intensity Level:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: _intensity,
          onChanged: (String? newValue) {
            setState(() {
              _intensity = newValue!;
            });
          },
          items: <String>['Low', 'Medium', 'High']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Widget for entering calories burned
  Widget _buildCaloriesBurnedInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Calories Burned:', style: TextStyle(fontSize: 16)),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Enter calories burned'),
          onChanged: (value) {
            setState(() {
              _caloriesBurned = int.tryParse(value) ?? 0;
            });
          },
        ),
      ],
    );
  }

  // Widget for entering workout notes
  Widget _buildNotesInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notes:', style: TextStyle(fontSize: 16)),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(hintText: 'Add any notes or comments'),
          onChanged: (value) {
            setState(() {
              _notes = value;
            });
          },
        ),
      ],
    );
  }

  // Save button to log the workout
  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        onPressed: () {
          // Call function to save workout data (you could save to a local database or backend here)
          print('Workout Saved!');
        },
        child: Text('Save Workout'),
      ),
    );
  }
}

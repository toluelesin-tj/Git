import 'package:flutter/material.dart'; //uses Flutter's material design widgets

// Add the main widget class for the Log Workout Page. Make it dynamic using StatefulWidget
class LogWorkoutPage extends StatefulWidget {
  @override
  _LogWorkoutPageState createState() => _LogWorkoutPageState();

}

// This holds the state for the page aka what variables to add etc so that this holds the data entered by the user
class _LogWorkoutPageState extends State<LogWorkoutPage> {

  final ScrollController _scrollController = ScrollController();
  // Variables to store the input data
  List<ExerciseEntry> _exercises = []; // stores exercises here in this list array

  void _addExercise() { // execute logic when user adds exercise
    setState(() { // setState tells Flutter the UI is changing and the page needs to be rebuilt
      _exercises.add(ExerciseEntry()); // Adds exercise to te list of exercises stored in the array
    });
  }

  void _saveWorkout() { // Executes logic when user taps Save Workout
    // Later: Save to local DB or backend
  for (int i = 0; i < _exercises.length; i++) {
    final e = _exercises[i];
    bool hasInvalid = false;

    for (var s in e.sets) {
      s.repsInvalid = s.reps == 0;
      s.weightInvalid = s.weight == 0;
      s.rpeInvalid = s.rpe == 0;

      if (s.repsInvalid || s.weightInvalid || s.rpeInvalid) {
        hasInvalid = true;
      }
    }

// Error message if workouts are not filled in correctly

   if (e.name.trim().isEmpty || hasInvalid) {
      // Scroll to this exercise card
      _scrollController.animateTo(
        i * 300, // estimate height (can tweak later)
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

// Check if any sets are incomplete (e.g., reps = 0)

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please complete all fields.')),
      );
      setState(() {}); // refresh to show red borders
      return;
    }
  }

// Print message in web app

    print('Workout Saved!');
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Workout saved successfully ✅')),
  );
    for (var e in _exercises) { // each e represents one exercise in exercises array
      print('Exercise: ${e.name}');
      print('Notes: ${e.notes}');
      for (var s in e.sets) {
        print('  Set - Reps: ${s.reps}, Weight: ${s.weight}, RPE: ${s.rpe}');
      }
      print('---'); // split each workout listed
    }
  }

  @override // need to redefine method or behaviours that comes from classes I'm inheriting from
  Widget build(BuildContext context) { //overriding the build() method from State class which needs to happen when making a widget that needs a UI
    return Scaffold( // return built in Flutter layour that gives an app bar, a body, floating buttons and bottom navigation etc
      appBar: AppBar(title: Text('📝 Log Workout')),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Add Exercise',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
// Error handling incase exercises are not filled in 

          if (_exercises.isEmpty)
            ...[
              SizedBox(height: 40),
              Center(
                child: Text(
                  'No exercises yet.\nTap "Add Exercise" to get started 💪',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: spacing * 2),
            ]
          else 
          ..._exercises.map((e) => ExerciseCard(entry: e)).toList(),

          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16), 
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )),
            onPressed: _addExercise,
            child: Text('➕ Add Exercise'),
          ),

          SizedBox(height: spacing),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(123, 234, 123, 45),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
            onPressed: _saveWorkout,
            child: Text('✅ Save Workout'),
          ),
        ],
      ),
    );
  }
}

// Exercise data model
class ExerciseEntry {
  String name = '';
  List<SetEntry> sets = [];
  String notes = '';
  bool isSuperset = false;

  ExerciseEntry() {
    sets.add(SetEntry());
  }
}

// build a class for one set entry in an exercise. Optional RPE field but important for advanced logging in the future
class SetEntry {
  int reps = 0;
  double weight = 0;
  double rpe = 0;
  
  bool repsInvalid = false;
  bool weightInvalid = false;
  bool rpeInvalid = false;
}

// ExerciseCard widget to input each exercise
class ExerciseCard extends StatefulWidget {
  final ExerciseEntry entry; // values cannot be changed once assigned using final. Value can only be assigned once essentially

  const ExerciseCard({required this.entry, Key? key}) : super(key: key); // makes the collection from the final field mutable

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

// Create a class to make the Exercise Card presenatable

class _ExerciseCardState extends State<ExerciseCard> { 
  @override
  Widget build(BuildContext context) { // make the widget look nice
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // make it have a nice border
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercise Details',
              style: sectionTitleStyle,
            ),
            const SizedBox(height: spacing),
            TextField(
              decoration: InputDecoration(labelText: 'Exercise Name', border: OutlineInputBorder()),
              onChanged: (val) => widget.entry.name = val, // when the user types something into the Exercise Name field, update entry.name with that specific value
            ),
            const SizedBox(height: 16),
            Divider(),
            Text(
              'Sets',
              style: sectionTitleStyle,
            ),
            const SizedBox(height: spacing),
            ..._buildSetFields(),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(onPressed: (){setState(() {
                widget.entry.sets.add(SetEntry());
              });
              }, 
              icon: Icon(Icons.add), 
              label: Text('Add Set')),
            ),
           const SizedBox(height: 16),
            Divider(),
            Text(
              'Notes',
              style: sectionTitleStyle,
            ),
            const SizedBox(height: spacing),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Any thoughts, cues, or reminders...',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => widget.entry.notes = val,
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              title: Text('Was this a Superset?'),
              value: widget.entry.isSuperset,
              onChanged: (val) {
                setState(() {
                  widget.entry.isSuperset = val ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

// Build all the sets for that exercise

   List<Widget> _buildSetFields() {
    return widget.entry.sets.asMap().entries.map((entry) {
      final index = entry.key;
      final set = entry.value;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
           _buildNumberInput(
                label: 'Reps',
                initial: set.reps.toString(),
                onChanged: (val) {
                  setState(() {
                    set.reps = int.tryParse(val) ?? 0;
                    set.repsInvalid = false; // clear error on change
                  });
                },
                isInvalid: set.repsInvalid,
              ),
            const SizedBox(width: 8),
            _buildNumberInput(
              label: 'Weight',
              initial: set.weight.toString(),
              onChanged: (val) {
                setState(() {
                    set.weight = double.tryParse(val) ?? 0;
                    set.weightInvalid = false; // clear error on change
                  });
                },
                isInvalid: set.weightInvalid,
              ),
            const SizedBox(width: 8),
            _buildNumberInput(
              label: 'RPE',
              initial: set.rpe.toString(),
              onChanged: (val) {
                setState(() {
                    set.rpe = double.tryParse(val) ?? 0;
                    set.rpeInvalid = false; // clear error on change
                  });
                },
                isInvalid: set.rpeInvalid,
              ),
          ],
        ),
      );
    }).toList();
  }

// Reusable helper function that builds a labeled number input

  Widget _buildNumberInput({
    required String label,
    required String initial,
    required Function(String) onChanged,
    required bool isInvalid,
  }) {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          errorText: isInvalid ? 'Required' : null,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

// Custom Font size stuff

const double spacing = 12.0;

const TextStyle sectionTitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
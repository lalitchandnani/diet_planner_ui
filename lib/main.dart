import 'package:flutter/material.dart';
import 'api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recommendation App',
      theme: ThemeData(
        primarySwatch: Colors.green, // set app bar color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange, // set button color
          ),
        ),
      ),
      home: DietForm(),
    );
  }
}

class DietForm extends StatefulWidget {
  @override
  _DietFormState createState() => _DietFormState();
}

class _DietFormState extends State<DietForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  Map<String, dynamic> _data = {};
  bool _isLoading = false;

  Future<void> _submitForm() async {
    setState(() {
      _isLoading = true; // Set isLoading to true to show the loading icon
    });

    if (_formKey.currentState?.validate() == true) {
      final name = _nameController.text.trim();
      final age = int.parse(_ageController.text.trim());
      final weight = int.parse(_weightController.text.trim());
      final height = int.parse(_heightController.text.trim());

      Api api = Api();
      final data = await api.fetchDietRecommendations(name, age, weight, height);

      setState(() {
        _isLoading = false; // Set isLoading to false to hide the loading icon
        _data = data;
      });
    } else {
      setState(() {
        _isLoading = false; // Set isLoading to false to hide the loading icon
        _data = {}; // Clear the data if form validation fails
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameValidator = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
    final ageValidator = RegExp(r"^(?:1[01][0-9]|100|[6-9][0-9]|[1-9][0-9]|[5-9])$");
    final weightValidator = RegExp(r"^(?:1[0-4][0-9]|150|[6-9][0-9]|[1-9][0-9]|[5-9])$");
    final heightValidator = RegExp(r"^(?:2[01][0-5]|1\d\d|1[3-9][0-9]|[5-9]\d|1[0-2][0-4])$");

    return MaterialApp(
      title: 'AI Diet Planner',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Diet Planner'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isLoading
              ? Center(child: CircularProgressIndicator()) // Show the loading icon if isLoading is true
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Enter your details:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          } else if (!nameValidator.hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          hintText: 'Enter your age',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          } else if (!ageValidator.hasMatch(value)) {
                            return 'Please enter a valid age between 5 and 100';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Weight (kg)',
                          hintText: 'Enter your weight',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your weight';
                          } else if (!weightValidator.hasMatch(value)) {
                            return 'Please enter a valid weight between 5 and 150 kg';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Height (cm)',
                          hintText: 'Enter your height',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your height';
                          } else if (!heightValidator.hasMatch(value)) {
                            return 'Please enter a valid height between 125 and 215 cm';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                          ),
                          onPressed: _submitForm,
                          child: Text('Submit'),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      if (_data.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recommendation:'),
                            Text('${_data['recommendation']}'),
                          ],
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

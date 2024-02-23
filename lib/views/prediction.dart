import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MLFormPage extends StatefulWidget {
  @override
  State<MLFormPage> createState() => _MLFormPageState();
}

class _MLFormPageState extends State<MLFormPage> {
  final TextEditingController feature1Controller = TextEditingController();
  final TextEditingController feature2Controller = TextEditingController();
  final TextEditingController feature3Controller = TextEditingController();
  String prediction = '';

  Future<void> sendFormValues() async {
    final String url = 'http://your_flask_server_ip:5000/predict'; // Adjust the URL accordingly
    final Map<String, dynamic> formData = {
      'feature1': feature1Controller.text,
      'feature2': feature2Controller.text,
      'feature3': feature3Controller.text,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(formData),
    );

    if (response.statusCode == 200) {
      setState(() {
        prediction = jsonDecode(response.body)['prediction'].toString();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ML Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: feature1Controller,
              decoration: InputDecoration(labelText: 'Feature 1'),
            ),
            TextField(
              controller: feature2Controller,
              decoration: InputDecoration(labelText: 'Feature 2'),
            ),
            TextField(
              controller: feature3Controller,
              decoration: InputDecoration(labelText: 'Feature 3'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                sendFormValues();
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Prediction: $prediction',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

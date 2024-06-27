import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddLabScreen extends StatefulWidget {
  @override
  _AddLabScreenState createState() => _AddLabScreenState();
}

class _AddLabScreenState extends State<AddLabScreen> {
  final TextEditingController labNameController = TextEditingController();
  final TextEditingController physicalLocationController = TextEditingController();
  bool publicAccess = false;

  Future<void> addLab(BuildContext context) async {
    final String apiUrl = "http://127.0.0.1/myproject/add_lab.php";
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'labName': labNameController.text,
          'physicalLocation': physicalLocationController.text,
          'publicAccess': publicAccess ? 1 : 0,
        }),
      ).timeout(Duration(seconds: 30)); 

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          Navigator.pop(context, true); // إعادة تحميل الشاشة الرئيسية
        } else {
          showErrorDialog(context, responseBody['message']);
        }
      } else {
        showErrorDialog(context, "Server error: ${response.statusCode}");
      }
    } catch (e) {
      showErrorDialog(context, "An error occurred: $e");
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Lab', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: labNameController,
                decoration: InputDecoration(
                  labelText: 'Lab Name',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 36, 117, 154)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 230, 240, 250),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 36, 117, 154),
                    ),
                  ),
                ),
                style: TextStyle(color: Color.fromARGB(255, 36, 117, 154)),
              ),
              SizedBox(height: 16),
              TextField(
                controller: physicalLocationController,
                decoration: InputDecoration(
                  labelText: 'Physical Location',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 36, 117, 154)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 230, 240, 250),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 36, 117, 154),
                    ),
                  ),
                ),
                style: TextStyle(color: Color.fromARGB(255, 36, 117, 154)),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Public Access',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: publicAccess,
                    onChanged: (value) {
                      setState(() {
                        publicAccess = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addLab(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 36, 117, 154),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Add Lab', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

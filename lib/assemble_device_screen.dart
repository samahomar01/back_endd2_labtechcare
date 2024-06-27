import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AssembleDeviceScreen extends StatefulWidget {
  final int labId;

  AssembleDeviceScreen({required this.labId});

  @override
  _AssembleDeviceScreenState createState() => _AssembleDeviceScreenState();
}

class _AssembleDeviceScreenState extends State<AssembleDeviceScreen> {
  List<dynamic> availableEquipment = [];
  List<dynamic> selectedEquipment = [];

  @override
  void initState() {
    super.initState();
    fetchAvailableEquipment();
  }

  Future<void> fetchAvailableEquipment() async {
    final String apiUrl = "http://127.0.0.1/myproject/get_available_equipment.php?labId=${widget.labId}";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        setState(() {
          availableEquipment = responseData;
        });
      } else {
        showErrorDialog("Server error: ${response.statusCode}\nResponse: ${response.body}");
      }
    } catch (e) {
      showErrorDialog("An error occurred: $e");
    }
  }

  void showErrorDialog(String message) {
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

  Future<void> assembleDevice() async {
    final String apiUrl = "http://127.0.0.1/myproject/assemble_device.php";
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'labId': widget.labId,
          'selectedEquipment': selectedEquipment.map((e) => e['id']).toList(),
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          Navigator.pop(context);
        } else {
          showErrorDialog(responseBody['message']);
        }
      } else {
        showErrorDialog("Server error: ${response.statusCode}");
      }
    } catch (e) {
      showErrorDialog("An error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assemble Device'),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Column(
        children: [
          Expanded(
            child: availableEquipment.isEmpty
                ? Center(child: Text('No available equipment.'))
                : ListView.builder(
                    itemCount: availableEquipment.length,
                    itemBuilder: (context, index) {
                      final equipment = availableEquipment[index];
                      final bool isSelected = selectedEquipment.contains(equipment);

                      return ListTile(
                        title: Text(equipment['name'] ?? 'Unknown Equipment Name'),
                        subtitle: Text('Type: ${equipment['type'] ?? 'Unknown Type'}'),
                        trailing: Checkbox(
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedEquipment.add(equipment);
                              } else {
                                selectedEquipment.remove(equipment);
                              }
                            });
                          },
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: assembleDevice,
            child: Text('Assemble Device'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 36, 117, 154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}

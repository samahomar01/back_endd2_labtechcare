import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'add_device_screen.dart';
import 'assemble_device_screen.dart';

class LabDetailScreen extends StatefulWidget {
  final int labId;

  LabDetailScreen({required this.labId});

  @override
  _LabDetailScreenState createState() => _LabDetailScreenState();
}

class _LabDetailScreenState extends State<LabDetailScreen> {
  List<dynamic> devices = [];
  List<dynamic> availableEquipment = [];

  @override
  void initState() {
    super.initState();
    fetchDevices();
    fetchAvailableEquipment();
  }

  Future<void> fetchDevices() async {
    final String apiUrl = "http://127.0.0.1/myproject/get_devices.php?labId=${widget.labId}";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        setState(() {
          devices = responseData;
        });
      } else {
        showErrorDialog("Server error: ${response.statusCode}\nResponse: ${response.body}");
      }
    } catch (e) {
      showErrorDialog("An error occurred: $e");
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Details'),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Column(
        children: [
          Expanded(
            child: devices.isEmpty
                ? Center(child: Text('No devices available.'))
                : ListView.builder(
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      final device = devices[index];
                      return ListTile(
                        title: Text(device['name'] ?? 'Unknown Device Name'),
                        subtitle: Text('Type: ${device['type'] ?? 'Unknown Type'}'),
                      );
                    },
                  ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDeviceScreen(labId: widget.labId)),
              );
            },
            child: Text('Add Device'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 36, 117, 154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AssembleDeviceScreen(labId: widget.labId)),
              );
            },
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

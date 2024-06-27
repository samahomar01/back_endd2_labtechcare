import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddDeviceScreen extends StatefulWidget {
  final int labId;

  AddDeviceScreen({required this.labId});

  @override
  _AddDeviceScreenState createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController serialNumberController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();

  final Map<String, TextEditingController> specificFieldControllers = {
    'field1': TextEditingController(),
    'field2': TextEditingController(),
    'field3': TextEditingController(),
    'field4': TextEditingController(),
    'field5': TextEditingController(),
    'field6': TextEditingController(),
    'field7': TextEditingController(),
    'field8': TextEditingController(),
    'field9': TextEditingController(),
  };

  String? selectedDeviceType;

  final Map<String, List<String>> deviceTypeFields = {
    'AccessPoint': ['subtype', 'wireless', 'speed'],
    'Case': ['type', 'size', 'motherboard', 'processor', 'memory', 'harddiskcap', 'harddisktype'],
    'Fax': ['type', 'subtype', 'speed', 'typeofpaper', 'refillcode'],
    'Keyboard': ['type', 'subtype', 'layout', 'aren', 'connectiontype'],
    'Monitor': ['type', 'subtype', 'size', 'maxresolution', 'coonnectiontype'],
    'Mouse': ['type', 'subtype', 'connectiontype'],
    'Networking': ['type', 'subtype', 'networktype', 'networkname'],
    'Photocopier': ['type', 'subtype', 'documentfeeder', 'maxsizepaper'],
    'Printer': ['type', 'subtype', 'maxpapersize', 'refillcode', 'connectiontype'],
    'Projector': ['type', 'subtype', 'maxprojectionsize'],
    'Router': ['subtype', 'totalnumports', 'poeports', 'wireless', 'speed'],
    'Scanner': ['type', 'subtype', 'maxsizetype'],
    'Switch': ['subtype', 'totalnumports', 'poeports', 'foconnections'],
  };

  Future<void> addDevice(BuildContext context) async {
    final String apiUrl = "http://127.0.0.1/myproject/add_device.php";
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'deviceName': deviceNameController.text,
          'serialNumber': serialNumberController.text,
          'status': statusController.text,
          'brand': brandController.text,
          'manufacturer': manufacturerController.text,
          'type': selectedDeviceType,
          'specificFields': specificFieldControllers.values.map((controller) => controller.text).toList(),
          'labId': widget.labId,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          Navigator.pop(context);
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
        title: Text('Add New Device', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Add New Device Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 36, 117, 154))),
              Divider(color: Colors.grey),
              SizedBox(height: 20),
              TextField(
                controller: deviceNameController,
                decoration: InputDecoration(labelText: 'Device Name', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                controller: serialNumberController,
                decoration: InputDecoration(labelText: 'Serial Number', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                controller: statusController,
                decoration: InputDecoration(labelText: 'Status', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                controller: brandController,
                decoration: InputDecoration(labelText: 'Brand', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                controller: manufacturerController,
                decoration: InputDecoration(labelText: 'Manufacturer', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Select Device Type', border: OutlineInputBorder()),
                value: selectedDeviceType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDeviceType = newValue;
                  });
                },
                items: deviceTypeFields.keys.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              if (selectedDeviceType != null && deviceTypeFields[selectedDeviceType]!.isNotEmpty)
                Column(
                  children: deviceTypeFields[selectedDeviceType]!.asMap().entries.map((entry) {
                    int index = entry.key;
                    String field = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        decoration: InputDecoration(labelText: field, border: OutlineInputBorder()),
                        controller: specificFieldControllers['field${index + 1}'],
                      ),
                    );
                  }).toList(),
                ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    addDevice(context);
                  },
                  child: Text('Add Device'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 36, 117, 154),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

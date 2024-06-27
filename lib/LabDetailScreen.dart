import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    fetchLabDetails();
  }

  Future<void> fetchLabDetails() async {
    await fetchDevices();
    await fetchAvailableEquipment();
  }

  Future<void> fetchDevices() async {
    final String apiUrl = "http://127.0.0.1/myproject/get_lab_devices.php?lab_id=${widget.labId}";
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
    final String apiUrl = "http://127.0.0.1/myproject/get_available_equipment.php?lab_id=${widget.labId}";
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

  Future<void> addDevice(String deviceName, List<String> components) async {
    final String apiUrl = "http://127.0.0.1/myproject/add_device.php";
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "lab_id": widget.labId,
        "device_name": deviceName,
        "components": components,
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        await fetchDevices();
        await fetchAvailableEquipment();
      } else {
        showErrorDialog(responseData['message']);
      }
    } else {
      showErrorDialog("Server error: ${response.statusCode}\nResponse: ${response.body}");
    }
  }

  Future<void> updateEquipmentStatus(List<int> equipmentIds) async {
    final String apiUrl = "http://127.0.0.1/myproject/update_equipment_status.php";
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "lab_id": widget.labId,
        "equipment_ids": equipmentIds,
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        await fetchAvailableEquipment();
      } else {
        showErrorDialog(responseData['message']);
      }
    } else {
      showErrorDialog("Server error: ${response.statusCode}\nResponse: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Details'),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Assembled Devices', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                final components = device['components'].split(',');
                return ListTile(
                  title: Text(device['device_name']),
                  subtitle: Text('Components: ${components.join(', ')}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Available Equipment', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: availableEquipment.length,
              itemBuilder: (context, index) {
                final equipment = availableEquipment[index];
                return ListTile(
                  title: Text(equipment['name']),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // الانتقال إلى شاشة إضافة معدة جديدة
                    // يجب عليك إنشاء هذه الشاشة إذا لم تكن موجودة
                    // await Navigator.push(context, MaterialPageRoute(builder: (context) => AddEquipmentScreen()));
                    await fetchAvailableEquipment();
                  },
                  child: Text('Add Equipment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController deviceNameController = TextEditingController();
                        List<String> selectedComponents = [];
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text('Assemble Device'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: deviceNameController,
                                    decoration: InputDecoration(labelText: 'Device Name'),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: availableEquipment.length,
                                      itemBuilder: (context, index) {
                                        final equipment = availableEquipment[index];
                                        return CheckboxListTile(
                                          title: Text(equipment['name']),
                                          value: selectedComponents.contains(equipment['id'].toString()),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              if (value == true) {
                                                selectedComponents.add(equipment['id'].toString());
                                              } else {
                                                selectedComponents.remove(equipment['id'].toString());
                                              }
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  child: Text('Assemble'),
                                  onPressed: () async {
                                    if (deviceNameController.text.isNotEmpty && selectedComponents.isNotEmpty) {
                                      await addDevice(deviceNameController.text, selectedComponents);
                                      await updateEquipmentStatus(selectedComponents.map((id) => int.parse(id)).toList());
                                      Navigator.of(context).pop();
                                    } else {
                                      showErrorDialog("Device name and components are required.");
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Text('Assemble Device'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

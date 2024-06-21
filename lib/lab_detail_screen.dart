import 'package:flutter/material.dart';
import 'edit_device_screen.dart'; // قم بإضافة هذا السطر

class LabDetailScreen extends StatelessWidget {
  final String labName;

  LabDetailScreen({required this.labName});

  @override
  Widget build(BuildContext context) {
    final String username = 'Samah';
    final String name = 'Ltaef';

    void showTransferDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String? selectedLab;
          List<String> labs = ['Lab 1', 'Lab 2', 'Lab 3', 'Lab 4'];

          return AlertDialog(
            title: Text('Select Lab to Transfer Device'),
            content: DropdownButton<String>(
              hint: Text('Select Lab'),
              value: selectedLab,
              onChanged: (String? newValue) {
                selectedLab = newValue;
              },
              items: labs.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Transfer'),
                onPressed: () {
                  if (selectedLab != null) {
                    // Perform the device transfer logic here
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a lab')),
                    );
                  }
                },
              ),
            ],
          );
        },
      );
    }

    void showSwapDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String? selectedDevice1;
          String? selectedDevice2;
          List<String> devices = ['Device 1', 'Device 2', 'Device 3', 'Device 4'];

          return AlertDialog(
            title: Text('Select Devices to Swap'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButton<String>(
                  hint: Text('Select Device 1'),
                  value: selectedDevice1,
                  onChanged: (String? newValue) {
                    selectedDevice1 = newValue;
                  },
                  items: devices.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  hint: Text('Select Device 2'),
                  value: selectedDevice2,
                  onChanged: (String? newValue) {
                    selectedDevice2 = newValue;
                  },
                  items: devices.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Swap'),
                onPressed: () {
                  if (selectedDevice1 != null && selectedDevice2 != null) {
                    // Perform the device swap logic here
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select both devices')),
                    );
                  }
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$labName Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 240, // Width of the sidebar
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 36, 117, 154), Color.fromRGBO(43, 64, 99, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 50, color: Colors.blue),
                      ),
                      SizedBox(height: 10),
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        username,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.white),
                  title: Text('Add Device', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit, color: Colors.white),
                  title: Text('Modify Device', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward, color: Colors.white),
                  title: Text('Transfer Device', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment, color: Colors.white),
                  title: Text('Assign Device', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic هنا
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people, color: Colors.white),
                  title: Text('Technicians', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.admin_panel_settings, color: Colors.white),
                  title: Text('Administrators', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.report, color: Colors.white),
                  title: Text('Reports', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic هنا
                  },
                ),
                ListTile(
                  leading: Icon(Icons.note, color: Colors.white),
                  title: Text('Notes', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic هنا
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Devices in $labName',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 36, 117, 154),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Device Name')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Device 1')),
                          DataCell(Text('Active')),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => EditDeviceScreen(deviceName: 'Device 1')),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  showTransferDialog();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.swap_horiz),
                                onPressed: () {
                                  showSwapDialog();
                                },
                              ),
                            ],
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Device 2')),
                          DataCell(Text('Inactive')),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => EditDeviceScreen(deviceName: 'Device 2')),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  showTransferDialog();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.swap_horiz),
                                onPressed: () {
                                  showSwapDialog();
                                },
                              ),
                            ],
                          )),
                        ]),
                        // Add more devices here
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 240, 250),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'LabTechCare is an application designed to help manage laboratory devices. You can add, modify, transfer, and assign devices to technicians. The application also provides reports and notes functionalities for better management.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 36, 117, 154),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

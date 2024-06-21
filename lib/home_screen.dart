import 'package:flutter/material.dart';
import 'add_device_screen.dart';
import 'edit_device_screen.dart';
import 'lab_detail_screen.dart';
import 'assign_device_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username = 'Samah';
  final String name = 'Ltaief';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'LabTechCare',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Text('$name ($username)', style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color.fromARGB(255, 36, 117, 154)),
            ),
          ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddDeviceScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit, color: Colors.white),
                  title: Text('Modify Device', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditDeviceScreen(deviceName: 'Device 1')),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz, color: Colors.white),
                  title: Text('Transfer Device', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment, color: Colors.white),
                  title: Text('Assign Device', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AssignDeviceScreen()),
                    );
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
                    Navigator.pushNamed(context, '/reports'); // تأكد من إضافة هذا السطر
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
                    'Laboratories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Lab No')),
                        DataColumn(label: Text('Total Devices')),
                        DataColumn(label: Text('Working Devices')),
                        DataColumn(label: Text('Non-working Devices')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Lab 1'), onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LabDetailScreen(labName: 'Lab 1')),
                            );
                          }),
                          DataCell(Text('30')),
                          DataCell(Text('27')),
                          DataCell(Text('3')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Lab 2'), onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LabDetailScreen(labName: 'Lab 2')),
                            );
                          }),
                          DataCell(Text('30')),
                          DataCell(Text('30')),
                          DataCell(Text('0')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Lab 3'), onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LabDetailScreen(labName: 'Lab 3')),
                            );
                          }),
                          DataCell(Text('30')),
                          DataCell(Text('30')),
                          DataCell(Text('0')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Lab 4'), onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LabDetailScreen(labName: 'Lab 4')),
                            );
                          }),
                          DataCell(Text('25')),
                          DataCell(Text('20')),
                          DataCell(Text('5')),
                        ]),
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

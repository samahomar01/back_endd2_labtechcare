import 'package:flutter/material.dart';

class AssignDeviceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assign Device Status',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Assign Device Status',
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
                          ElevatedButton(
                            onPressed: () {
                              // Assign device as active
                            },
                            child: Text('Set Active'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Assign device as inactive
                            },
                            child: Text('Set Inactive'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Device 2')),
                      DataCell(Text('Inactive')),
                      DataCell(Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Assign device as active
                            },
                            child: Text('Set Active'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Assign device as inactive
                            },
                            child: Text('Set Inactive'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      )),
                    ]),
                    // Add more devices here
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This page allows you to assign the status of devices as either Active or Inactive.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 117, 154),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

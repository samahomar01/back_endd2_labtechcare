import 'package:flutter/material.dart';

class EngineerEfficiencyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Engineer Efficiency Report',
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
                'Engineer Efficiency Report',
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
                    DataColumn(label: Text('Engineer Name')),
                    DataColumn(label: Text('Solved Tickets')),
                    DataColumn(label: Text('Efficiency Rating')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Engineer 1')),
                      DataCell(Text('5')),
                      DataCell(Text('90%')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Engineer 2')),
                      DataCell(Text('8')),
                      DataCell(Text('85%')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Engineer 3')),
                      DataCell(Text('3')),
                      DataCell(Text('75%')),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This report shows the efficiency of engineers over a specific period.',
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

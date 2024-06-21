import 'package:flutter/material.dart';

class FaultAnalysisReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fault Analysis Report',
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
                'Fault Analysis Report',
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
                    DataColumn(label: Text('Lab')),
                    DataColumn(label: Text('Device Type')),
                    DataColumn(label: Text('Faults Number')),
                    DataColumn(label: Text('Problem')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Lab 1')),
                      DataCell(Text('PC')),
                      DataCell(Text('3')),
                      DataCell(Text('Not working')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Lab 2')),
                      DataCell(Text('Printer')),
                      DataCell(Text('2')),
                      DataCell(Text('Paper jam')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Lab 3')),
                      DataCell(Text('Projector')),
                      DataCell(Text('1')),
                      DataCell(Text('No display')),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This report shows the fault analysis over a specific period.',
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

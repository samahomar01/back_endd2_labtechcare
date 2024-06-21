import 'package:flutter/material.dart';

class PendingTicketsReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pending Tickets Report',
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
                'Pending Tickets Report',
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
                    DataColumn(label: Text('Ticket Number')),
                    DataColumn(label: Text('Ticket Date')),
                    DataColumn(label: Text('Reason')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('001')),
                      DataCell(Text('2024-03-01')),
                      DataCell(Text('Waiting for parts')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('002')),
                      DataCell(Text('2024-03-02')),
                      DataCell(Text('In progress')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('003')),
                      DataCell(Text('2024-03-03')),
                      DataCell(Text('Waiting for approval')),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This report shows the pending tickets over a specific period.',
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

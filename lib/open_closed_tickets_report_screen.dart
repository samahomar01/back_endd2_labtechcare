import 'package:flutter/material.dart';

class OpenClosedTicketsReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Open and Closed Tickets Report',
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
                'Open and Closed Tickets Report',
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
                    DataColumn(label: Text('Status')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('001')),
                      DataCell(Text('2024-03-01')),
                      DataCell(Text('Closed')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('002')),
                      DataCell(Text('2024-03-02')),
                      DataCell(Text('Open')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('003')),
                      DataCell(Text('2024-03-03')),
                      DataCell(Text('Closed')),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This report shows the open and closed tickets over a specific period.',
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

import 'package:flutter/material.dart';
import 'engineer_efficiency_report_screen.dart';
import 'open_closed_tickets_report_screen.dart';
import 'pending_tickets_report_screen.dart';
import 'fault_analysis_report_screen.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Reports',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 36, 117, 154),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Engineer Efficiency Report'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EngineerEfficiencyReportScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Open and Closed Tickets Report'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OpenClosedTicketsReportScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Pending Tickets Report'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PendingTicketsReportScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Fault Analysis Report'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaultAnalysisReportScreen()),
                );
              },
            ),
            Spacer(), // أضف هذا السطر لدفع العناصر السابقة للأعلى
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 240, 250),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'These reports provide critical insights into the efficiency of engineers, status of tickets, and fault analysis. They help in identifying areas for improvement, ensuring timely resolution of issues, and enhancing overall management of laboratory devices.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 117, 154),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

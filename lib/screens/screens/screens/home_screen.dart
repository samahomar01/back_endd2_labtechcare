import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LabTechCare'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('LabTechCare'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('الملف الشخصي'),
              onTap: () {
                // Navigate to profile
              },
            ),
            ListTile(
              title: Text('الإعدادات'),
              onTap: () {
                // Navigate to settings
              },
            ),
            ListTile(
              title: Text('تسجيل الخروج'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of reports
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('عنوان التقرير $index'),
              subtitle: Text('حالة التقرير: جديد'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to report details
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to new report screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

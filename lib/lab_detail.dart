import 'package:flutter/material.dart';

import 'add_device_screen.dart';

class LabDetailScreen extends StatelessWidget {
  final int labId;

  LabDetailScreen({required this.labId});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> devices = []; // ستحتاج إلى جلب البيانات من قاعدة البيانات هنا

    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Details'),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Column(
        children: [
          Expanded(
            child: devices.isEmpty
                ? Center(child: Text('No devices available.'))
                : ListView.builder(
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      final device = devices[index];
                      return ListTile(
                        title: Text(device['name'] ?? 'Unknown Device Name'),
                        subtitle: Text('Type: ${device['type'] ?? 'Unknown Type'}'),
                      );
                    },
                  ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDeviceScreen(labId: labId)),
              );
            },
            child: Text('Add Device'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 36, 117, 154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SelectDevicesScreen extends StatefulWidget {
  @override
  _SelectDevicesScreenState createState() => _SelectDevicesScreenState();
}

class _SelectDevicesScreenState extends State<SelectDevicesScreen> {
  List<String> devices = ['Device 1', 'Device 2', 'Device 3', 'Device 4'];
  String? selectedDevice1;
  String? selectedDevice2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Devices to Swap'),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              hint: Text('Select First Device'),
              value: selectedDevice1,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDevice1 = newValue;
                });
              },
              items: devices.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: Text('Select Second Device'),
              value: selectedDevice2,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDevice2 = newValue;
                });
              },
              items: devices.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 36, 117, 154),
              ),
              onPressed: () {
                if (selectedDevice1 != null && selectedDevice2 != null) {
                  // Perform the device swap logic here
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select two devices')),
                  );
                }
              },
              child: Text('Swap Devices', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

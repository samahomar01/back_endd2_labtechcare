import 'package:flutter/material.dart';

class AddDeviceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String username = 'Samah';
    final String name = 'Ltaief';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Device',
          style: TextStyle(color: Colors.white),
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
                    // Add your navigation logic here
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
                    // Add your navigation logic هنا
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
                    // Add your navigation logic هنا
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Add New Device Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 36, 117, 154),
                      ),
                    ),
                    Divider(color: Colors.grey), // Horizontal line
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Device Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Serial Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Status',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Brand',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Manufacturer',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey), // Horizontal line
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Type',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Subtype',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Layout',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Connection Type',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your add logic here
                        },
                        child: Text('Add Device'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 36, 117, 154), // Button color
                          foregroundColor: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'add_lab.dart';
import 'add_device_screen.dart';
import 'dart:convert';
import 'LabDetailScreen.dart'; // تأكد من أن المسار صحيح


class HomeScreen extends StatefulWidget {
  final String username;
  final String name;

  HomeScreen({required this.username, required this.name});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> labs = [];

  @override
  void initState() {
    super.initState();
    fetchLabs();
  }

  Future<void> fetchLabs() async {
    final String apiUrl = "http://127.0.0.1/myproject/get_labs.php";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        setState(() {
          labs = responseData;
        });
      } else {
        showErrorDialog("Server error: ${response.statusCode}\nResponse: ${response.body}");
      }
    } catch (e) {
      showErrorDialog("An error occurred: $e");
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('LabTechCare', style: TextStyle(color: Colors.white)),
            Spacer(),
            Text('${widget.name} (${widget.username})', style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color.fromARGB(255, 36, 117, 154)),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 36, 117, 154),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 240,
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
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 50, color: Colors.blue),
                      ),
                      SizedBox(height: 10),
                      Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text(widget.username, style: TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.white),
                  title: Text('Add Lab', style: TextStyle(color: Colors.white)),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddLabScreen()),
                    );
                    fetchLabs(); // إعادة تحميل المعامل عند العودة من شاشة إضافة معمل
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
                    // Add your navigation logic here
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
                    // Add your navigation logic here
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Laboratories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  labs.isEmpty
                      ? Center(child: Text('No labs available.'))
                      : Expanded(
                          child: ListView.builder(
                            itemCount: labs.length,
                            itemBuilder: (context, index) {
                              final lab = labs[index];
                              final publicAccessText = int.tryParse(lab['publicAccess'].toString()) == 1 ? 'Available for public use' : 'Not available for public use';
                              return ListTile(
                                title: Text(lab['name'] ?? 'Unknown Lab Name'),
                                subtitle: Text('Location: ${lab['physicalLocation'] ?? 'Unknown Location'}\n$publicAccessText'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LabDetailScreen(labId: int.parse(lab['id'])), // تمرير معرف المعمل
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

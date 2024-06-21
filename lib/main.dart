import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'report_screen.dart'; // تأكد من إضافة هذا السطر
import 'package:http/http.dart' as http;
import 'dart:convert'; // لاستخدام jsonEncode و jsonDecode

void main() {
  runApp(LabTechCareApp());
}

class LabTechCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LabTechCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        '/reports': (context) => ReportScreen(), // أضف هذا السطر
      },
    );
  }
}

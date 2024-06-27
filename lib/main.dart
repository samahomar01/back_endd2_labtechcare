import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'report_screen.dart';
import 'add_lab.dart';  // تأكد من استيراد صفحة إضافة المعمل

void main() {
  runApp(LabTechCareApp());
}

class LabTechCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LabTechCare Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(username: 'DefaultUser', name: 'DefaultName'),  // القيم الافتراضية
        '/reports': (context) => ReportScreen(),
        '/add_lab': (context) => AddLabScreen(),  // إضافة مسار (route) لصفحة إضافة المعمل
      },
    );
  }
}

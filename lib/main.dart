import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/pages/notification.dart';
import 'package:tubes_kelompok_7/pages/profile.dart';
import 'package:tubes_kelompok_7/pages/settings.dart';
import 'pages/home.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental Outdoor App',
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

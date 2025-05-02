import 'package:flutter/material.dart';
import 'pages/home.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental Outdoor App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

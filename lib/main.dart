import 'package:flutter/material.dart';
import 'first_page.dart';

void main() {
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate System', // Changed to Real Estate
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(), // Start with the first page
      debugShowCheckedModeBanner: false,
    );
  }
}

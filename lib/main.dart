// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sonya_flutter_application/drawer_screen.dart';
import 'package:sonya_flutter_application/calculate_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LINGKARAN',
      home: Scaffold(
        appBar: AppBar(
          title: Text('LINGKARAN'),
        ),
        body: Stack(
          children: [
            DrawerScreen(),
            AreaCalculator(),
          ],
        ),
      ),
    );
  }
}

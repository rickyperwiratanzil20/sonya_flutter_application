// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:sonya_flutter_application/DrawerScreen.dart';
import 'package:sonya_flutter_application/LibraryHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Library',
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('E-Library'),
        ),
        body: Stack(
          children: [
            DrawerScreen(),
            LibraryHome(),
          ],
        ),
      ),
    );
  }
}

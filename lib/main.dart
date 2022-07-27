// @dart=2.9
import 'package:sonya_flutter_application/Dosen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Dosen',
      home: Dosen(),
    );
  }
}

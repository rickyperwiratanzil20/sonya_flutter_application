import 'package:flutter/material.dart';
import 'package:sonya_flutter_application/LibraryDataModel.dart';

class Detail extends StatelessWidget {
  final LibaryDataModel libaryDataModel;
  const Detail({Key? key, required this.libaryDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(libaryDataModel.judul),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 300,
                image: AssetImage(libaryDataModel.gambar),
              ),
              Text(
                libaryDataModel.judul,
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}

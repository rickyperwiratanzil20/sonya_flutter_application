// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:sonya_flutter_application/LibraryDataModel.dart';
import 'package:sonya_flutter_application/detail.dart';

class LibraryHome extends StatefulWidget {
  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  static List<String> judul = [
    "GOING OFFLINE: Menemukan Jati Diri Di Dunia Penuh Distraksi",
    "The Things You Can See Only When You Slow Down",
    "Cinta untuk Perempuan yang Tidak Sempurna",
    "Mengheningkan Cinta",
    "Loving the Wounded Soul",
  ];

  static List gambar = [
    'assets/Going _Offline.jpg',
    'assets/Slow_Down.jpg',
    'assets/Cinta_untuk_Perempuan.jpg',
    'assets/Mengheningkan_Cinta.jpg',
    'assets/Loving_the_Wounded_Soul.jpg',
  ];

  final List<LibaryDataModel> LibraryData = List.generate(judul.length,
      (index) => LibaryDataModel('${judul[index]}', '${gambar[index]}'));

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Column(
          children: [
            isDrawerOpen
                ? GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    },
                  )
                : GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () {
                      setState(() {
                        xOffset = 290;
                        yOffset = 80;
                        isDrawerOpen = true;
                      });
                    },
                  ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(LibraryData[index].judul,
                          style: TextStyle(fontSize: 20)),
                      subtitle: Text('Tekan Untuk Mengetahui Lebih Detail'),
                      leading: Image(
                        image: AssetImage(LibraryData[index].gambar),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Detail(libaryDataModel: LibraryData[index])));
                      },
                    ),
                  );
                },
                itemCount: judul.length,
              ),
            ),
          ],
        ));
  }
}

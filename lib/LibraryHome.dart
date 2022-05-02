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

  final List<Map<String, dynamic>> judul = [
    {
      "gambar": 'assets/Going _Offline.jpg',
      "name": "GOING OFFLINE: Menemukan Jati Diri Di Dunia Penuh Distraksi",
    },
    {
      "gambar": 'assets/Slow_Down.jpg',
      "name": "The Things You Can See Only When You Slow Down",
    },
    {
      "gambar": 'assets/Cinta_untuk_Perempuan.jpg',
      "name": "Cinta untuk Perempuan yang Tidak Sempurna"
    },
    {"gambar": 'assets/Mengheningkan_Cinta.jpg', "name": "Mengheningkan Cinta"},
    {
      "gambar": 'assets/Loving_the_Wounded_Soul.jpg',
      "name": "Loving the Wounded Soul"
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = judul;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = judul;
    } else {
      results = judul
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  // static List<String> judul = [
  //   "GOING OFFLINE: Menemukan Jati Diri Di Dunia Penuh Distraksi",
  //   "The Things You Can See Only When You Slow Down",
  //   "Cinta untuk Perempuan yang Tidak Sempurna",
  //   "Mengheningkan Cinta",
  //   "Loving the Wounded Soul",
  // ];

  // static List gambar = [
  //   'assets/Going _Offline.jpg',
  //   'assets/Slow_Down.jpg',
  //   'assets/Cinta_untuk_Perempuan.jpg',
  //   'assets/Mengheningkan_Cinta.jpg',
  //   'assets/Loving_the_Wounded_Soul.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
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
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search)),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _foundUsers.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(_foundUsers[index]["name"]),
                      child: ListTile(
                        leading: Image(
                          image: AssetImage(_foundUsers[index]['gambar']),
                        ),
                        title: Text(_foundUsers[index]['name']),
                        // onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) =>
                        //           Detail(libaryDataModel: LibraryData[index])));
                        // },
                      ),
                    ),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
          // Expanded(

          // child: ListView.builder(
          //   itemBuilder: (context, index) {
          //     return Card(
          //       child: ListTile(
          //         title: Text(LibraryData[index].judul,
          //             style: TextStyle(fontSize: 20)),
          //         subtitle: Text('Tekan Untuk Mengetahui Lebih Detail'),
          //         leading: Image(
          //           image: AssetImage(LibraryData[index].gambar),
          //         ),
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (context) =>
          //                   Detail(libaryDataModel: LibraryData[index])));
          //         },
          //       ),
          //     );
          //   },
          //   itemCount: judul.length,
          // ),
          // ),
        ],
      ),
    );
  }
}

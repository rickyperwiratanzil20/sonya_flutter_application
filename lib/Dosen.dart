// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:sonya_flutter_application/CustomListDosen.dart';
import 'package:sonya_flutter_application/DosenAPI.dart';
import 'package:sonya_flutter_application/InputDosen.dart';
import 'package:flutter/material.dart';

class Dosen extends StatefulWidget {
  @override
  DosenState createState() {
    return DosenState();
  }
}

class DosenState extends State<Dosen> {
  Future<List<DosenResult>> dosenFuture = DosenResult.show();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosen'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InputDosen();
              },
            ),
          );
        },
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BerandaBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<DosenResult>>(
            future: dosenFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final dosens = snapshot.data!;
                return buildDosen(dosens);
              } else {
                return const Text('No Data');
              }
            }),
      ),
    );
  }

  Widget buildDosen(List<DosenResult> dosens) => ListView.builder(
        itemCount: dosens.length,
        itemBuilder: (context, index) {
          final dosen = dosens[index];

          return Card(
            child: CustomListDosen(
              id: dosen.id,
              nama: dosen.nama_dosen,
              gender: dosen.jenis_kelamin,
              role: dosen.jabatan,
              thumbnail: Image(
                image: AssetImage("assets/Profile.jpeg"),
              ),
            ),
            color: Color.fromRGBO(242, 238, 238, 1),
          );
        },
      );
}

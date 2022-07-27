// ignore_for_file: prefer_const_constructors, file_names

import 'package:sonya_flutter_application/Dosen.dart';
import 'package:sonya_flutter_application/DosenAPI.dart';
import 'package:sonya_flutter_application/EditDosen.dart';
import 'package:flutter/material.dart';

class CustomListDosen extends StatelessWidget {
  const CustomListDosen({
    Key? key,
    required this.thumbnail,
    required this.id,
    required this.nama,
    required this.role,
    required this.gender,
  }) : super(key: key);

  final Widget thumbnail;
  final String id;
  final String nama;
  final String role;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: thumbnail,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              nama: nama,
              role: role,
              gender: gender,
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 16.0,
            ),
            onSelected: (String result) {
              switch (result) {
                case 'Edit':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditDosen(
                          id: id,
                          nama_dosen: nama,
                          jenis_kelamin: gender,
                          jabatan: role,
                        );
                      },
                    ),
                  );
                  break;
                case 'Hapus':
                  DosenResult.delete(id).then(
                    (value) {
                      if (value.status == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Dosen();
                            },
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(value.message != null
                              ? value.message
                              : 'Delete Data'),
                        ),
                      );
                    },
                  );
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem<String>(
                value: 'Hapus',
                child: Text('Hapus'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.nama,
    required this.role,
    required this.gender,
  }) : super(key: key);

  final String nama;
  final String role;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nama,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          Divider(),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            role,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            gender,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}

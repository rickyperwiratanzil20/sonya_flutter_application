import 'dart:convert';
import 'package:http/http.dart' as http;

class DosenResult {
  bool status;
  String message;
  String id;
  String nama_dosen;
  String jenis_kelamin;
  String jabatan;

  DosenResult({
    required this.status,
    required this.message,
    required this.id,
    required this.nama_dosen,
    required this.jenis_kelamin,
    required this.jabatan,
  });

  static String url = "http://192.168.0.104:8000";

  factory DosenResult.createPostResult(Map<String, dynamic> object) {
    return DosenResult(
      status: object['status'],
      message: object['massage'],
      id: object['id'].toString(),
      nama_dosen: object['nama_dosen'],
      jenis_kelamin: object['jenis_kelamin'],
      jabatan: object['jabatan'],
    );
  }

  static Future<List<DosenResult>> show() async {
    String apiURL = url + "/dosen";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listDosen = (jsonObject as Map<String, dynamic>)['data'];

    List<DosenResult> dosens = [];
    for (int i = 0; i < listDosen.length; i++) {
      dosens.add(DosenResult.createPostResult(listDosen[i]));
    }

    return dosens;
  }

  static Future<DosenResult> create(
    String nama_dosen,
    String jenis_kelamin,
    String jabatan,
  ) async {
    String apiURL = url + "/dosen/create";

    var apiResult = await http.post(apiURL, body: {
      "nama_dosen": nama_dosen,
      "jenis_kelamin": jenis_kelamin,
      "jabatan": jabatan,
    });
    var jsonObject = json.decode(apiResult.body);

    return DosenResult.createPostResult(jsonObject);
  }

  static Future<DosenResult> update(
    String id,
    String nama_dosen,
    String jenis_kelamin,
    String jabatan,
  ) async {
    String apiURL = url + "/dosen/update";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
      "nama_dosen": nama_dosen,
      "jenis_kelamin": jenis_kelamin,
      "jabatan": jabatan,
    });
    var jsonObject = json.decode(apiResult.body);

    return DosenResult.createPostResult(jsonObject);
  }

  static Future<DosenResult> delete(
    String id,
  ) async {
    String apiURL = url + "/dosen/destroy";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
    });
    var jsonObject = json.decode(apiResult.body);

    return DosenResult.createPostResult(jsonObject);
  }
}

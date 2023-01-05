import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/surat.dart';
import 'package:wangunsari/services/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wangunsari/services/user.dart';

Future<ApiResponse> getMails() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.get(
      Uri.parse(getMailsUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['data']['surats'].map((p) => Surats.fromJson(p)).toList();
        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = 'Fetch all mails fail - something went wrong';
  }
  return apiResponse;
}

Future<ApiResponse> submitDomisiliMail(
  String rt,
  String rw,
  String nik,
  String nama,
  String tempatLahir,
  String tanggalLahir,
  String jenisKelamin,
  String wargaNegara,
  String negaraNama,
  String agama,
  String statusKawin,
  String pendidikan,
  String pekerjaan,
  String alamat,
  String alamatAsal,
  String tinggalSejak,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    print(token);
    // print(token);
    final response = await http.post(
      Uri.parse(submitSuratDomisiliUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'rt': rt,
        'rw': rw,
        'nik': nik,
        'nama': nama,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tanggalLahir,
        'jenis_kelamin': jenisKelamin,
        'warga_negara': wargaNegara,
        'negara_nama': negaraNama,
        'agama': agama,
        'status_kawin': statusKawin,
        'pendidikan': pendidikan,
        'pekerjaan': pekerjaan,
        'alamat': alamat,
        'alamat_asal': alamatAsal,
        'tinggal_sejak': tinggalSejak,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.key.elementAt(0)][0];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = 'Error - Submit Surat Domisili';
  }
  return apiResponse;
}

Future<ApiResponse> submitKeteranganMail(
  String rt,
  String rw,
  String nik,
  String nama,
  String tempatLahir,
  String tanggalLahir,
  String jenisKelamin,
  String wargaNegara,
  String negaraNama,
  String agama,
  String statusKawin,
  String pendidikan,
  String pekerjaan,
  String alamat,
  String suratId,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    print(token);
    // print(token);
    final response = await http.post(
      Uri.parse(submitSuratKeteranganUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'rt': rt,
        'rw': rw,
        'nik': nik,
        'nama': nama,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tanggalLahir,
        'jenis_kelamin': jenisKelamin,
        'warga_negara': wargaNegara,
        'negara_nama': negaraNama,
        'agama': agama,
        'status_kawin': statusKawin,
        'pendidikan': pendidikan,
        'pekerjaan': pekerjaan,
        'alamat': alamat,
        'jenis_surat_id': suratId,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.key.elementAt(0)][0];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = 'Error - Submit Surat Keterangan';
  }
  return apiResponse;
}

import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_domisili_detail.dart';
import 'package:wangunsari/models/mail_kelahiran_detail.dart';
import 'package:wangunsari/models/mail_keterangan_detail.dart';
import 'package:wangunsari/services/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wangunsari/services/user.dart';

// Pengajuan Surat Domisili
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

// Detail Surat Domisili
Future<ApiResponse> domisiliMailDetail(String id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse('$detailDomisiliUrl$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = MailDomisiliDetailService.fromJson(jsonDecode(response.body)['data']);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.key.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 500:
        apiResponse.error = jsonDecode(response.body)['meta']['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = 'Error - Mail Domisili Detail Service';
  }
  return apiResponse;
}

// Perbaiki Surat Domisili
Future<ApiResponse> editDomisiliMail(
  String suratId,
  String detailSuratId,
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
    // print(token);
    final response = await http.post(
      Uri.parse(perbaikiDomisiliUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'id': suratId,
        'surat_detail_id': detailSuratId,
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
        apiResponse.data = jsonDecode(response.body)['meta'];
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
    apiResponse.error = 'Error - Perbaiki Submit Surat Domisili';
  }
  return apiResponse;
}

// Pengajuan Surat Keterangan
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
  String tipeSurat,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
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
        'jenis_surat_id': tipeSurat,
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

// Detail Surat Keterangan
Future<ApiResponse> keteranganMailDetail(String id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse('$detailKeteranganUrl$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = MailKeteranganDetailService.fromJson(jsonDecode(response.body)['data']);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.key.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 500:
        apiResponse.error = jsonDecode(response.body)['meta']['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = 'Error - Mail Keterangan Detail Service';
  }
  return apiResponse;
}

// Perbaiki Surat Keterangan
Future<ApiResponse> editKeteranganMail(
  String suratId,
  String detailSuratId,
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
  String tipeSurat,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(perbaikiKeteranganUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'id': suratId,
        'surat_detail_id': detailSuratId,
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
        'jenis_surat_id': tipeSurat,
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
    apiResponse.error = 'Error - Perbaiki Surat Keterangan';
  }
  return apiResponse;
}

// Pengajuan Surat Kelahiran
Future<ApiResponse> submitKelahiranMail(
  String rt,
  String rw,
  String namaAnak,
  String tempatLahirAnak,
  String tanggalLahirAnak,
  String waktuLahirAnak,
  String jenisKelaminAnak,
  String anakKe,
  String beratAnak,
  String panjangAnak,
  String nikAyah,
  String namaAyah,
  String tempatLahirAyah,
  String tanggalLahirAyah,
  String agamaAyah,
  String pekerjaanAyah,
  String alamatAyah,
  String nikIbu,
  String namaIbu,
  String tempatLahirIbu,
  String tanggalLahirIbu,
  String agamaIbu,
  String pekerjaanIbu,
  String alamatIbu,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(submitSuratKelahiranUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'rt': rt,
        'rw': rw,
        'nama_anak': namaAnak,
        'tempat_lahir': tempatLahirAnak,
        'tanggal_lahir': tanggalLahirAnak,
        'waktu_lahir': waktuLahirAnak,
        'jenis_kelamin': jenisKelaminAnak,
        'anak_ke': anakKe,
        'berat': beratAnak,
        'panjang': panjangAnak,
        'ayah_nik': nikAyah,
        'ayah_nama': namaAyah,
        'ayah_tempat_lahir': tempatLahirAyah,
        'ayah_tanggal_lahir': tanggalLahirAyah,
        'ayah_agama': agamaAyah,
        'ayah_pekerjaan': pekerjaanAyah,
        'ayah_alamat': alamatAyah,
        'ibu_nik': nikIbu,
        'ibu_nama': namaIbu,
        'ibu_tempat_lahir': tempatLahirIbu,
        'ibu_tanggal_lahir': tanggalLahirIbu,
        'ibu_agama': agamaIbu,
        'ibu_pekerjaan': pekerjaanIbu,
        'ibu_alamat': alamatIbu,
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
    apiResponse.error = 'Error - Submit Surat Kelahiran';
  }
  return apiResponse;
}

// Detail Surat Kelahiran
Future<ApiResponse> kelahiranMailDetail(String id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.get(
      Uri.parse('$detailKelahiranUrl$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = MailKelahiranDetailService.fromJson(jsonDecode(response.body)['data']);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.key.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 500:
        apiResponse.error = jsonDecode(response.body)['meta']['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e.toString());
    apiResponse.error = 'Error - Mail Kelahiran Detail Service';
  }
  return apiResponse;
}

// Perbaiki Surat Kelahiran
Future<ApiResponse> editKelahiranMail(
  String suratId,
  String detailSuratId,
  String rt,
  String rw,
  String namaAnak,
  String tempatLahirAnak,
  String tanggalLahirAnak,
  String waktuLahirAnak,
  String jenisKelaminAnak,
  String anakKe,
  String beratAnak,
  String panjangAnak,
  String nikAyah,
  String namaAyah,
  String tempatLahirAyah,
  String tanggalLahirAyah,
  String agamaAyah,
  String pekerjaanAyah,
  String alamatAyah,
  String nikIbu,
  String namaIbu,
  String tempatLahirIbu,
  String tanggalLahirIbu,
  String agamaIbu,
  String pekerjaanIbu,
  String alamatIbu,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(perbaikiKelahiranUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'id': suratId,
        'surat_detail_id': detailSuratId,
        'rt': rt,
        'rw': rw,
        'nama_anak': namaAnak,
        'tempat_lahir': tempatLahirAnak,
        'tanggal_lahir': tanggalLahirAnak,
        'waktu_lahir': waktuLahirAnak,
        'jenis_kelamin': jenisKelaminAnak,
        'anak_ke': anakKe,
        'berat': beratAnak,
        'panjang': panjangAnak,
        'ayah_nik': nikAyah,
        'ayah_nama': namaAyah,
        'ayah_tempat_lahir': tempatLahirAyah,
        'ayah_tanggal_lahir': tanggalLahirAyah,
        'ayah_agama': agamaAyah,
        'ayah_pekerjaan': pekerjaanAyah,
        'ayah_alamat': alamatAyah,
        'ibu_nik': nikIbu,
        'ibu_nama': namaIbu,
        'ibu_tempat_lahir': tempatLahirIbu,
        'ibu_tanggal_lahir': tanggalLahirIbu,
        'ibu_agama': agamaIbu,
        'ibu_pekerjaan': pekerjaanIbu,
        'ibu_alamat': alamatIbu,
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
    apiResponse.error = 'Error - Perbaiki Surat Kelahiran';
  }
  return apiResponse;
}

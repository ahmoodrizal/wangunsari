import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_domisili_detail.dart';
import 'package:wangunsari/models/mail_kelahiran_detail.dart';
import 'package:wangunsari/models/mail_keterangan_detail.dart';
import 'package:wangunsari/models/mail_nikah_detail.dart';
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

// Pengajuan Surat Nikah
Future<ApiResponse> submitNikahMail(
  String rw,
  String rt,
  String calonA,
  String calonB,
  String date,
  String time,
  String withWho,
  String anakNik,
  String anakNomorKK,
  String anakNama,
  String anakTempatLahir,
  String anakTanggalLahir,
  String anakWargaNegara,
  String anakNegaraNama,
  String anakAgama,
  String anakStatusKawin,
  String anakPendidikan,
  String anakPekerjaan,
  String anakAlamat,
  String ayahNik,
  String ayahNama,
  String ayahTanggalLahir,
  String ayahWargaNegara,
  String ayahNegaraNama,
  String ayahAgama,
  String ayahPekerjaan,
  String ayahAlamat,
  String ibuNik,
  String ibuNama,
  String ibuTanggalLahir,
  String ibuWargaNegara,
  String ibuNegaraNama,
  String ibuAgama,
  String ibuPekerjaan,
  String ibuAlamat,
  String calonNik,
  String calonNoKK,
  String calonNama,
  String calonTempatLahir,
  String calonTanggalLahir,
  String calonWargaNegara,
  String calonNegaraNama,
  String calonAgama,
  String calonStatusKawin,
  String calonPendidikan,
  String calonPekerjaan,
  String calonAlamat,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(submitSuratNikahUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'rt': rt,
        'rw': rw,
        'calon_a': calonA,
        'calon_b': calonB,
        'anak_nik': anakNik,
        'anak_no_kk': anakNomorKK,
        'anak_nama': anakNama,
        'anak_tempat_lahir': anakTempatLahir,
        'anak_tanggal_lahir': anakTanggalLahir,
        'anak_warga_negara': anakWargaNegara,
        'anak_negara_nama': anakNegaraNama,
        'anak_agama': anakAgama,
        'anak_status_kawin': anakStatusKawin,
        'anak_pendidikan': anakPendidikan,
        'anak_pekerjaan': anakPekerjaan,
        'anak_alamat': anakAlamat,
        'ayah_nik': ayahNik,
        'ayah_nama': ayahNama,
        'ayah_tanggal_lahir': ayahTanggalLahir,
        'ayah_warga_negara': ayahWargaNegara,
        'ayah_negara_nama': ayahNegaraNama,
        'ayah_agama': ayahAgama,
        'ayah_pekerjaan': ayahPekerjaan,
        'ayah_alamat': ayahAlamat,
        'ibu_nik': ibuNik,
        'ibu_nama': ibuNama,
        'ibu_tanggal_lahir': ibuTanggalLahir,
        'ibu_warga_negara': ibuWargaNegara,
        'ibu_negara_nama': ibuNegaraNama,
        'ibu_agama': ibuAgama,
        'ibu_pekerjaan': ibuPekerjaan,
        'ibu_alamat': ibuAlamat,
        'tanggal': date,
        'waktu': time,
        'dengan_seorang': withWho,
        'calon_nik': calonNik,
        'calon_no_kk': calonNoKK,
        'calon_nama': calonNama,
        'calon_tempat_lahir': calonTempatLahir,
        'calon_tanggal_lahir': calonTanggalLahir,
        'calon_warga_negara': calonWargaNegara,
        'calon_negara_nama': calonNegaraNama,
        'calon_agama': calonAgama,
        'calon_status_kawin': calonStatusKawin,
        'calon_pendidikan': calonPendidikan,
        'calon_pekerjaan': calonPekerjaan,
        'calon_alamat': calonAlamat,
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
    // print(e.toString());
    apiResponse.error = 'Error - Submit Surat Nikah';
  }
  return apiResponse;
}

// Detail Surat Nikah
Future<ApiResponse> nikahMailDetail(String id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.get(
      Uri.parse('$detailNikahUrl$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = MailNikahDetailService.fromJson(jsonDecode(response.body)['data']);
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
    // print(e.toString());
    apiResponse.error = 'Error - Mail Nikah Detail Service';
  }
  return apiResponse;
}

// Perbaiki Surat Nikah
Future<ApiResponse> editNikahMail(
  String suratId,
  String detailSuratId,
  String rw,
  String rt,
  String calonA,
  String calonB,
  String date,
  String time,
  String withWho,
  String anakNik,
  String anakNomorKK,
  String anakNama,
  String anakTempatLahir,
  String anakTanggalLahir,
  String anakWargaNegara,
  String anakNegaraNama,
  String anakAgama,
  String anakStatusKawin,
  String anakPendidikan,
  String anakPekerjaan,
  String anakAlamat,
  String ayahNik,
  String ayahNama,
  String ayahTanggalLahir,
  String ayahWargaNegara,
  String ayahNegaraNama,
  String ayahAgama,
  String ayahPekerjaan,
  String ayahAlamat,
  String ibuNik,
  String ibuNama,
  String ibuTanggalLahir,
  String ibuWargaNegara,
  String ibuNegaraNama,
  String ibuAgama,
  String ibuPekerjaan,
  String ibuAlamat,
  String calonNik,
  String calonNoKK,
  String calonNama,
  String calonTempatLahir,
  String calonTanggalLahir,
  String calonWargaNegara,
  String calonNegaraNama,
  String calonAgama,
  String calonStatusKawin,
  String calonPendidikan,
  String calonPekerjaan,
  String calonAlamat,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(perbaikiNikahUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'id': suratId,
        'surat_detail_id': detailSuratId,
        'rt': rt,
        'rw': rw,
        'calon_a': calonA,
        'calon_b': calonB,
        'anak_nik': anakNik,
        'anak_no_kk': anakNomorKK,
        'anak_nama': anakNama,
        'anak_tempat_lahir': anakTempatLahir,
        'anak_tanggal_lahir': anakTanggalLahir,
        'anak_warga_negara': anakWargaNegara,
        'anak_negara_nama': anakNegaraNama,
        'anak_agama': anakAgama,
        'anak_status_kawin': anakStatusKawin,
        'anak_pendidikan': anakPendidikan,
        'anak_pekerjaan': anakPekerjaan,
        'anak_alamat': anakAlamat,
        'ayah_nik': ayahNik,
        'ayah_nama': ayahNama,
        'ayah_tanggal_lahir': ayahTanggalLahir,
        'ayah_warga_negara': ayahWargaNegara,
        'ayah_negara_nama': ayahNegaraNama,
        'ayah_agama': ayahAgama,
        'ayah_pekerjaan': ayahPekerjaan,
        'ayah_alamat': ayahAlamat,
        'ibu_nik': ibuNik,
        'ibu_nama': ibuNama,
        'ibu_tanggal_lahir': ibuTanggalLahir,
        'ibu_warga_negara': ibuWargaNegara,
        'ibu_negara_nama': ibuNegaraNama,
        'ibu_agama': ibuAgama,
        'ibu_pekerjaan': ibuPekerjaan,
        'ibu_alamat': ibuAlamat,
        'tanggal': date,
        'waktu': time,
        'dengan_seorang': withWho,
        'calon_nik': calonNik,
        'calon_no_kk': calonNoKK,
        'calon_nama': calonNama,
        'calon_tempat_lahir': calonTempatLahir,
        'calon_tanggal_lahir': calonTanggalLahir,
        'calon_warga_negara': calonWargaNegara,
        'calon_negara_nama': calonNegaraNama,
        'calon_agama': calonAgama,
        'calon_status_kawin': calonStatusKawin,
        'calon_pendidikan': calonPendidikan,
        'calon_pekerjaan': calonPekerjaan,
        'calon_alamat': calonAlamat,
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
    print(e.toString());
    apiResponse.error = 'Error - Perbaiki Surat Nikah';
  }
  return apiResponse;
}

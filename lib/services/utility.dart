import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/meta.dart';
import 'package:wangunsari/models/surat.dart';
import 'package:wangunsari/models/tracking_mail.dart';
import 'package:wangunsari/services/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wangunsari/services/user.dart';

// Fetch Data Surat
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
    apiResponse.error = 'Gagal mengambil daftar data surat pengajuan penduduk';
  }
  return apiResponse;
}

// Fetch Detail Surat
Future<ApiResponse> mailDetail(String id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.get(
      Uri.parse('$trackingMailUrl$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = TrackingMailService.fromJson(jsonDecode(response.body)['data']);
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
    apiResponse.error = 'Gagal mengambil detail data surat';
  }
  // print('$mailDetailUrl$id');
  return apiResponse;
}

// Batalkan Pengajuan Surat
Future<ApiResponse> abortedMail(String id, String reason) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(batalkanSuratUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'surat_id': id,
        'alasan_dibatalkan': reason,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = Meta.fromJson(jsonDecode(response.body)['meta']);
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
    apiResponse.error = 'Gagal Batalkan Surat - something went wrong';
  }
  return apiResponse;
}

// Fetch Data Surat
import 'dart:convert';
import 'package:wangunsari/models/surat.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/user.dart';
import 'package:http/http.dart' as http;
import '../models/api_response.dart';

Future<ApiResponse> getRWMails() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.get(
      Uri.parse(rwMailList),
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
    apiResponse.error = 'Fetch all RW mails fail - something went wrong';
  }
  return apiResponse;
}

Future<ApiResponse> approveRWMails(String suratId, String info, String note, String reg) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(rwapproveMail),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'surat_id': suratId,
        'keterangan': info,
        'catatan': note,
        'reg_no': reg,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['data']['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = 'Proses Setujui Surat RW Gagal - Error System';
  }
  return apiResponse;
}

Future<ApiResponse> rejectRWMails(String suratId, String info, String note) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.post(
      Uri.parse(rwrejectMail),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'surat_id': suratId,
        'keterangan': info,
        'catatan': note,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['data']['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = 'Proses Penolakan Surat RW Gagal - Error System';
  }
  return apiResponse;
}

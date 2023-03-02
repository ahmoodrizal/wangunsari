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

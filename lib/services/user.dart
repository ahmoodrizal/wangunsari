import 'dart:convert';
import 'package:wangunsari/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:wangunsari/services/config.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Login
Future<ApiResponse> login(String nik, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Accept': 'application/json'},
      body: {
        'nik': nik,
        'password': password,
      },
    );
    // print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        apiResponse.data = UserService.fromJson(jsonDecode(response.body));
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
    apiResponse.error = 'Error - User Service login';
  }

  return apiResponse;
}

// get user detail
Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    // print(token);
    final response = await http.get(
      Uri.parse(userDetailUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = UserService.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = 'Error - User Details';
        break;
    }
  } catch (e) {
    apiResponse.error = e.toString();
  }
  return apiResponse;
}

// get user token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('user_id') ?? 0;
}

// Logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'dart:convert';
import 'dart:io';

User? user;
List<dynamic>? workouts = [];
String apiUrl = dotenv.env['API_URL'] ?? "";

Future<void> completeOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_completed', true);
}

Future<User?> fetchUserDetails() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? userId = pref.getString('userId');
  if (userId != null) {
    final res = await http.get(
      Uri.parse('$apiUrl/users/$userId'),
      headers: {
        HttpHeaders.authorizationHeader: pref.getString('jwt') ?? '',
      },
    );
    if (res.statusCode == 200) {
      user = User.fromJson(jsonDecode(res.body));
      return user;
    } else {
      print("Failed to fetch user details");
    }
  } else {
    print('User ID or token not found');
  }
  return null;
}

Future<List<dynamic>?> fetchWorkoutDetails() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  final response = await http.get(
    Uri.parse('$apiUrl/workouts'),
    headers: {
      HttpHeaders.authorizationHeader: pref.getString('jwt') ?? '',
    },
  );
  if (response.statusCode == 200) {
    workouts = json.decode(response.body);
    return workouts;
  } else {
    throw Exception('Failed to load data');
  }
}

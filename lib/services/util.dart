import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'dart:convert';
import 'dart:io';

User? user;
String apiUrl = dotenv.env['API_URL'] ?? "";

Future<void> completeOnboarding() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setBool('onboarding_completed', true);
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
  List<dynamic>? workouts = [];

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

Future<List<dynamic>?> fetchWorkoutExercise(workoutId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  List<dynamic>? exercises = [];
  final response = await http.get(
    Uri.parse('$apiUrl/workouts/$workoutId/exercises'),
    headers: {
      HttpHeaders.authorizationHeader: pref.getString('jwt') ?? '',
    },
  );

  if (response.statusCode == 200) {
    exercises = json.decode(response.body)['exercises'];
    print(exercises);
    return exercises;
  } else {
    throw Exception('Failed to load data');
  }
}

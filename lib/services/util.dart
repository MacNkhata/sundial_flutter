import 'package:shared_preferences/shared_preferences.dart';

Future<void> completeOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_completed', true);
}

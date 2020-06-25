import 'package:click_clinic/shared/acceuil.dart';
import 'package:click_clinic/shared/switcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:click_clinic/shared/onboarding.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/", //initialRoute is ruining it
      routes: {
        '/': (context) => Acceuil(), //qst is can I put this widget in materialApp :/ 
        "first": (context) => OnboardingScreen(),
      },
    );
  }
}

//implement the error handling before release
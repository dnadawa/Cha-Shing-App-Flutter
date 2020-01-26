import 'package:cha_shing/screens/home.dart';
import 'package:cha_shing/screens/log-in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/log-in.dart';



String email;
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email') ?? null;


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff08fd00),
        accentColor: Color(0xff00a550)
      ),

      home: email==null?LogIn():HomePage(),

    );
  }
}

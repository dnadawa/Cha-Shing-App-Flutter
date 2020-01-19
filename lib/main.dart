import 'package:cha_shing/screens/code-input.dart';
import 'package:cha_shing/screens/log-in.dart';
import 'package:cha_shing/screens/verify.dart';
import 'package:flutter/material.dart';

import 'screens/log-in.dart';
import 'screens/log-in.dart';
import 'screens/verify.dart';
import 'screens/verify.dart';

void main(){

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

      home: LogIn(),

    );
  }
}

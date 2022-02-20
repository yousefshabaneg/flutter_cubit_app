import 'package:flutter/material.dart';
import 'package:flutter_cubit_appp/pages/nav_pages/main_page.dart';
import 'package:flutter_cubit_appp/pages/welcome_page.dart';

import 'pages/detail_page.dart';
import 'pages/nav_pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailPage(),
    );
  }
}

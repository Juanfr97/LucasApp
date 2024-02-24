import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucas_num_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context)
  {
    return const CupertinoApp(
      title: "Lucas\'s Number App",
      home: HomeScreen(),
      theme: CupertinoThemeData(
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


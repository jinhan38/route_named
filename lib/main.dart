import 'package:flutter/material.dart';
import 'package:route_named/first_screen.dart';
import 'package:route_named/second_screen.dart';
import 'package:route_named/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        // 이동할 페이지들을 경로 형식으로 등록해 놓는 것
        "/": (context) => const FirstScreen(),
        "/second" : (context) => const SecondScreen(),
        "/third" : (context) => const ThirdScreen(),
      },
    );
  }
}

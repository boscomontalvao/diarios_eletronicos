import 'package:diarios_eletronicos/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(192, 181, 181, 1.0),
          fontFamily: 'Inter',
        ));
  }
}

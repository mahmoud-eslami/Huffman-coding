import 'package:flutter/material.dart';
import 'package:huffman_code/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Huffman coding',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const SplashPage(),
    );
  }
}

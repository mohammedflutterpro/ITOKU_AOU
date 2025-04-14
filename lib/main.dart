import 'package:flutter/material.dart';

import 'screen/0_Home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITOKU',
      home: const HomePage_Toku(),
    );
  }
}



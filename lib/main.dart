import 'package:flutter/material.dart';

import 'pages/bloc_builder_page.dart';
import 'pages/bloc_listener_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BlocBuilderPage(), // latihan bloc builder
      home: BlocListenerPage(), // latihan bloc listener
    );
  }
}

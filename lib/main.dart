import 'package:flutter/material.dart';
import 'package:untitled/services/menu/menu_view.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuView(),
    );
  }
}

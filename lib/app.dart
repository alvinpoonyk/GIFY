import 'package:flutter/material.dart';
import 'package:gify/pages/explore_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExplorePage(),
    );
  }
}
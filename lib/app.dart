import 'package:flutter/material.dart';
import 'package:gify/pages/conversations_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversationsPage(),
    );
  }
}
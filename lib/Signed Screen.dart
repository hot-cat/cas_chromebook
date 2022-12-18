import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    this.title,
  });
  final String? title;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomScrollviewAppBar(offset: 0),
        Expanded(child: Center(child: Text(" ${widget.title} Screen"))),
      ],
    );
  }
}

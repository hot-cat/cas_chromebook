import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    this.title,
  });
  final String? title;

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
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

import 'package:flutter/material.dart';

class DynamicTextWidget extends StatefulWidget {
  String title;
  DateTime dateTime;

  DynamicTextWidget({required this.title, required this.dateTime});

  @override
  _DynamicTextWidgetState createState() => _DynamicTextWidgetState();
}

class _DynamicTextWidgetState extends State<DynamicTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            " ${widget.dateTime.hour}:${widget.dateTime.minute}  ${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

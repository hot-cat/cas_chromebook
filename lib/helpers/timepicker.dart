import 'package:flutter/material.dart';

class TimePickerButton extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;
  TimePickerButton({required this.onTimeSelected});

  @override
  _TimePickerButtonState createState() => _TimePickerButtonState();
}

class _TimePickerButtonState extends State<TimePickerButton> {
  TimeOfDay _time = TimeOfDay.now();

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
      widget.onTimeSelected(_time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: _selectTime,
      child: Text('${_time.format(context)}'),
    );
  }
}

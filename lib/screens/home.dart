import 'dart:typed_data';

import 'package:cas_chromebook/resources/storage_methods.dart';
import 'package:cas_chromebook/utils.dart';
import 'package:cas_chromebook/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/feed.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    this.title,
  });
  final String? title;

  @override
  _HomeScreen createState() => _HomeScreen();
}

enum parts { creativity, activity, service }

Set<parts> selection = <parts>{parts.creativity, parts.service};
List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
  DateTime(2023, 01, 6),
  DateTime(2023, 02, 6),
];

class _HomeScreen extends State<HomeScreen> {
  bool loading = true;
  Uint8List? _file;
  @override
  Widget build(BuildContext context) {
    // FirestoreService().updateQuizzes("baba");
    return Row(
      children: <Widget>[
        Expanded(flex: 3, child: Feed()),
        Container(
          width: 1,
          height: double.infinity,
          color: Colors.black,
        ),
        Expanded(
          flex: 1,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                child: TopWidgets(),
              ),
              BottomWidgets(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDefaultRangeDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.teal[800],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const Text('Range Date Picker (With default value)'),
        CalendarDatePicker2(
          config: config,
          initialValue: _rangeDatePickerValueWithDefaultValue,
          onValueChanged: (values) =>
              setState(() => _rangeDatePickerValueWithDefaultValue = values),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Selection(s):  '),
            const SizedBox(width: 10),
            Text(
              _getValueText(
                config.calendarType,
                _rangeDatePickerValueWithDefaultValue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget TopWidgets() {
    return item();
    // return RoundedImage(imagePath: 'assets/campus.jpg', title: 'example');
  }

  Widget BottomWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Add buttons here
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
          child: loading
              ? Container(
                  key: Key("show"),
                  child: Center(
                    child: InkWell(
                      child: Container(
                        child: Icon(
                          Icons.arrow_drop_up,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          loading = !loading;
                        });
                      },
                    ),
                  ),
                )
              : Container(
                  key: Key("hide"),
                  child: Center(
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            child: Icon(
                              Icons.arrow_drop_down,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              loading = !loading;
                            });
                          },
                        ),
                        _buildDefaultRangeDatePickerWithValue(),
                      ],
                    ),
                  ),
                ),
        ),

        Padding(
          padding: EdgeInsets.all(8.0),
        ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SegmentedButton<parts>(
                  showSelectedIcon: false,
                  segments: const <ButtonSegment<parts>>[
                    ButtonSegment<parts>(
                        value: parts.creativity, label: Text('Creativity')),
                    ButtonSegment<parts>(
                      value: parts.activity,
                      label: Text('Activity'),
                    ),
                    ButtonSegment<parts>(
                        value: parts.service, label: Text('Service')),
                  ],
                  selected: selection,
                  onSelectionChanged: (Set<parts> newSelection) {
                    setState(() {
                      selection = newSelection;
                    });
                  },
                  multiSelectionEnabled: true,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
        ),
      ],
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }
}

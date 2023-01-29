import 'dart:typed_data';

import 'package:cas_chromebook/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/datepicker.dart';
import '../helpers/timepicker.dart';
import '../resources/firestore_methods.dart';
import '../resources/storage_methods.dart';

class MyInputForm extends StatefulWidget {
  @override
  _MyInputFormState createState() => _MyInputFormState();
}

class _MyInputFormState extends State<MyInputForm> {
  final nameController = TextEditingController();
  final infoController = TextEditingController();
  Uint8List? _file;
  String? urlImage;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _handleSelectedTime(TimeOfDay time) {
    // Do something with the selected time
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: infoController,
                    decoration: InputDecoration(labelText: 'Info'),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            if (nameController.text != null) {
                              Uint8List file =
                                  await pickImage(ImageSource.gallery);

                              setState(() {
                                _file = file;
                              });
                            }
                          },
                          child: Text('Load'),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child:
                            DatePickerWidget(onDateSelected: _onDateSelected),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TimePickerButton(
                            onTimeSelected: _handleSelectedTime),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  (_file != null)
                      ? ConstrainedBox(
                          constraints: BoxConstraints(
                              minWidth: 200,
                              minHeight: 150,
                              maxWidth: 300,
                              maxHeight: 225),
                          child: Image.memory(_file!),
                        )
                      : Text("no image"),
                  SizedBox(height: 10.0),
                  FilledButton(
                    onPressed: () {
                      if (_file != null) {
                        final currentUser = FirebaseAuth.instance.currentUser;
                        FireStoreMethods().uploadPost(
                            nameController.text,
                            infoController.text,
                            _file!,
                            currentUser!.uid,
                            currentUser.displayName ?? "Anonymous",
                            currentUser.photoURL ??
                                "https://1fid.com/wp-content/uploads/2022/06/no-profile-picture-6-1024x1024.jpg",
                            selectedDate.add(Duration(
                                hours: selectedTime.hour,
                                minutes: selectedTime.minute)));
                      }
                      Navigator.pop(context);
                      print(nameController.text);
                      print(infoController.text);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}

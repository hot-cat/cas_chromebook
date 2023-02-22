import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget item() {
  return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("events")
          .doc("trash")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        if (!snapshot.data!.exists) {
          return Text("No data found");
        }
        Map<String, dynamic> data =
            snapshot.data?.data() as Map<String, dynamic>;
        return Column(
          children: <Widget>[
            Text(data['name']),
            Text(data['info']),
          ],
        );
      });
}

class RoundImage extends StatelessWidget {
  final String name;
  final String info;
  final String imageUrl;
  final DateTime heldDate;

  RoundImage(
      {required this.name,
      required this.info,
      required this.imageUrl,
      required this.heldDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //tova e gornata chast
        Expanded(
          flex: 2,
          child: TitleAndDateTimeWidget(
            title: name,
            dateTime: heldDate,
          ),
        ),
        //tuka e snimkata na eveta
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 200,
                minHeight: 150,
                maxWidth: (MediaQuery.of(context).size.height / 3) * 4,
                maxHeight: (MediaQuery.of(context).size.height)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(imageUrl),
            ),
          ),
        ),
        //donlata chast ot posta
        Expanded(
          flex: 3,
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}

class TitleAndDateTimeWidget extends StatelessWidget {
  final String title;
  final DateTime dateTime;

  TitleAndDateTimeWidget({
    required this.title,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitlize(title),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            " ${dateTime.hour}:${dateTime.minute}  ${dateTime.day}/${dateTime.month}/${dateTime.year}",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  String capitlize(String title) {
    List<String> words = title.split(" ");

    for (var i = 0; i < words.length; i++) {
      words[i] =
          words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }

    return words.join(" ");
  }
}

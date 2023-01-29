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

  RoundImage({required this.name, required this.info, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // Text(name),
          // Text(info),
          Expanded(
            flex: 2,
            child: Container(color: Colors.blueGrey),
          ),
          ConstrainedBox(
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

          Expanded(
            flex: 1,
            child: Container(color: Colors.blueGrey),
          ),
          // AspectRatio(
          //   aspectRatio: 4 / 3,
          //   child: Image.network(imageUrl),
          // )
          // Container(
          //   child: FittedBox(
          //     fit: BoxFit.cover,
          //     child: Image.network(imageUrl),
          //   ),
          // ),
        ],
      ),
    );
  }
}

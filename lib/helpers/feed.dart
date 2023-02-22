import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class Feed extends StatefulWidget {
  // Map<String, dynamic> data;

  // Feed({required this.data});
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> with AutomaticKeepAliveClientMixin {
  PageController _pageController = PageController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pageController.jumpToPage(0);
          //refresh the feed here
        },
        child: Icon(Icons.refresh),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          //s page view pravim feeda da se scrollva
          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot post = snapshot.data!.docs[index];
              Map<String, dynamic> data = post.data() as Map<String, dynamic>;
              //round Image e widgeta deto otgovarq za kak izglezda posta (namira se v widgets.dart)
              //here call the function from feed
              return RoundImage(
                name: data['name'],
                info: data['info'],
                imageUrl: data['postUrl'],
                heldDate: data['dateHeld'].toDate(),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileData {
  int creativityHours = 1;
  int activityHours = 0;
  int serviceHours = 0;
  int numberEventsOrganized = 4;
  int numberEventsPaticipated = 16;
  int likes = 0;
  String userName = "lucy";
  String bio = "Height is just a number";
}

class ProfileScreen extends StatefulWidget {
  static String route = '/profile';
  ProfileScreen({
    this.title,
  });
  final String? title;

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  ProfileData profile = ProfileData();

  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("CAS Profile")),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Creativity Hours: ${profile.creativityHours}"),
                          Text("Activity Hours: ${profile.activityHours}"),
                          Text("Service Hours: ${profile.serviceHours}")
                        ]),
                    const SizedBox(width: 20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Events Paricipated: ${profile.numberEventsPaticipated}"),
                          Text(
                              "Events Organized: ${profile.numberEventsOrganized}"),
                        ]),
                    const SizedBox(width: 20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Name: ${profile.userName}"),
                          Text("Likes: ${profile.likes}")
                        ])
                  ])),
              const SizedBox(height: 20),
              Row(children: [
                Container(
                    child: RichText(
                        text: TextSpan(
                            text: "Bio:",
                            children: [TextSpan(text: profile.bio)])))
              ]),
            ])));
  }
}

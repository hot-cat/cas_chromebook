import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  // String uid = FirebaseAuth.instance.currentUser!.uid;

  // Future<void> updateQuizzes(Quiz quiz) {
  //   return users.doc(uid).collection("quizzes").add(<String, dynamic>{
  //     'topic_id': quiz.topic_id,
  //     'time': quiz.time,
  //     'mistakes': quiz.mistakes,
  //   });
  // }
}

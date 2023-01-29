import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String name;
  final String info;
  final String uid;
  final String username;
  final likes;
  final String postId;
  final DateTime datePublished;
  final DateTime dateHeld;
  final String postUrl;
  final String profImage;

  const Post({
    required this.name,
    required this.info,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.dateHeld,
    required this.postUrl,
    required this.profImage,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        name: snapshot["name"],
        info: snapshot["info"],
        uid: snapshot["uid"],
        likes: snapshot["likes"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        dateHeld: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage']);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "info": info,
        "uid": uid,
        "likes": likes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        "dateHeld": dateHeld,
        'postUrl': postUrl,
        'profImage': profImage
      };
}

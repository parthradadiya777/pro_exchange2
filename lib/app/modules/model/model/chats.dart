import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsData  {
  final String message;
  final String userFrom;
  final String time;


  ChatsData({
    required this.message,
    required this.userFrom,
    required this.time,

  });

  static ChatsData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ChatsData(
      message: snapshot['message'],
      userFrom: snapshot['userFrom'],
      time: snapshot['time'],

    );
  }

  Map<String, dynamic> toJson() =>
      {
        "message":message,
        "userFrom":userFrom,
        "time":time,

      };
}
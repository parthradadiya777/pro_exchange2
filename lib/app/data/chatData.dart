import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/bikes.dart';
import 'package:pro_exchange2/app/modules/model/model/furniture.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

import '../modules/model/model/chats.dart';

class ChatStoreData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> ChatsData1(
    String message,
    String userFrom,
    String time,
      String path,
  ) async {
    String res = 'Something error occured';
    try {
      ChatsData chatsData = ChatsData(
        message: message,
        userFrom: userFrom,
        time: time,
      );

      _firestore
          .collection('chats')
          .doc(path)
          .collection(path)
          .doc()
          .set(chatsData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

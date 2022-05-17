import 'package:cloud_firestore/cloud_firestore.dart';

class MakeofferData {
 final String offer;
 final String time;

 MakeofferData({
   required this.offer,
   required this.time

 });
 static MakeofferData fromSnap(DocumentSnapshot snap){
   var snapshot = snap.data() as Map<String,dynamic>;

   return MakeofferData(
     offer: snapshot['offer'],
     time: snapshot['time'],



   );
 }
 Map<String,dynamic> toJson() => {
   "offer":offer,
   "time":time,


 };
}
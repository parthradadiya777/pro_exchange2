import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyprofileViewView extends StatefulWidget {
  const MyprofileViewView({Key? key}) : super(key: key);

  @override
  State<MyprofileViewView> createState() => _MyprofileViewViewState();
}

class _MyprofileViewViewState extends State<MyprofileViewView> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  File? img;
  String? name;
  var userimage;
  var email;
  var number;
  var location;

  singleImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    img = File(image!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyprofileView'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('user').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            var data = snapshot.data!.docs;
            final docRef = FirebaseFirestore.instance
                .collection('user')
                .doc(_auth.currentUser!.uid);
            docRef.get().then((DocumentSnapshot doc) {
              name = doc['name'];
              email = doc['email'];
              userimage = doc['image'];
              setState(() {});
            });
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    await singleImage();
                    FirebaseFirestore.instance
                        .collection('user')
                        .doc(_auth.currentUser!.uid)
                        .set({
                      'image': img,
                    }, SetOptions(merge: true));
                  },
                  child: CircleAvatar(
                      child: img == null ? Text(name![0]) : Image.network(userimage)),
                ),
                Text('User Name : $name'),
                Text('EmailId : $email'),
                Text('Conatct Number : $number'),
              ],
            );
          }),
    );
  }
}

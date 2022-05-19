import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyprofileViewView extends StatefulWidget {
  const MyprofileViewView({Key? key}) : super(key: key);

  @override
  State<MyprofileViewView> createState() => _MyprofileViewViewState();
}

class _MyprofileViewViewState extends State<MyprofileViewView> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  firebase_storage.Reference? ref;

  File? img;
  String? a;
  CollectionReference? imgRef;

  String? name;
  var userimage;
  var email;
  var number;
  var location;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();

  singleImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      img = File(image!.path);
    });
  }

  var data;

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
            final docRef = FirebaseFirestore.instance
                .collection('user')
                .doc(_auth.currentUser!.uid);
            docRef.get().then((DocumentSnapshot doc) {
              data = doc;
              setState(() {});
            });
            return data == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                              children: [
                                data['image'] == null
                                    ? Text('Please Edit Image')
                                    : Image.network(data['image'])
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                            child: data['image'] == null
                                ? Text(data['name'][0])
                                : Image.network(
                                    data['image'],
                                    loadingBuilder: (context, child,
                                            loadingProgress) =>
                                        loadingProgress == null
                                            ? child
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                color: Colors.white,
                                              )),
                                  )),
                      ),
                      IconButton(
                          onPressed: () async {
                            await singleImage();

                            await uploadFile();
                            FirebaseFirestore.instance
                                .collection('user')
                                .doc(_auth.currentUser!.uid)
                                .set({
                              'image': a,
                            }, SetOptions(merge: true));
                          },
                          icon: Icon(Icons.image)),
                      Row(
                        children: [
                          Text('User Name : ${data['name']}'),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: TextField(
                                      controller: namecontroller,
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('CANCEL')),
                                      TextButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('user')
                                                .doc(_auth.currentUser!.uid)
                                                .update({
                                              'name': namecontroller.text,
                                            }).catchError((e) {
                                              print(e.toString());
                                            });
                                            Get.back();
                                            namecontroller.clear();
                                          },
                                          child: Text('UPDATE')),
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('EmailId : ${data['email']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Conatct Number : ${data['number']}'),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: TextField(
                                      controller: numbercontroller,
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('CANCEL')),
                                      TextButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('user')
                                                .doc(_auth.currentUser!.uid)
                                                .update({
                                              'number': numbercontroller.text,
                                            }).catchError((e) {
                                              print(e.toString());
                                            });
                                            Get.back();
                                            numbercontroller.clear();
                                          },
                                          child: Text('UPDATE')),
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit)),
                        ],
                      ),
                    ],
                  );
          }),
    );
  }

  Future uploadFile() async {
    int i = 1;
    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(img!.path)}');
    await ref?.putFile(img!).whenComplete(() async {
      await ref?.getDownloadURL().then((value) {
        a = value;
        imgRef?.add({'url': value});
        i++;
      });
    });
  }
}

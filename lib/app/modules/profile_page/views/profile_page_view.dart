import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/profile_page/views/profile_product_details.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';

import '../../../data/offer.dart';
import '../controllers/profile_page_controller.dart';
import '../edit_profile/views/edit_profile_view.dart';
import '../edit_profile/views/editimage_view.dart';
import '../edit_profile/views/editimage_view.dart';
import 'myprofile_view_view.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  bool b = true;
  bool uploading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;
  List<File> _image = [];
  List<String> imgUrl = [];
  final picker = ImagePicker();

  List<String> a = List<String>.filled(0, '', growable: true);
  bool selected = true;
  bool selected1 = true;
  bool selected2 = true;
  bool selected3 = true;
  bool selected4 = true;
  bool selected5 = true;

  void first() {
    setState(() {
      selected = true;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = false;
    });
  }

  void first1() {
    setState(() {
      selected = false;
      selected1 = true;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = false;
    });
  }

  void first2() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = true;
      selected3 = false;
      selected4 = false;
      selected5 = false;
    });
  }

  void first3() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = false;
      selected3 = true;
      selected4 = false;
      selected5 = false;
    });
  }

  void first4() {
    setState(() {
      selected = true;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = false;
    });
  }

  void first5() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = true;
      selected5 = false;
    });
  }

  void first6() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = true;
    });
  }

  var snap;

  var progress;

  var percentage;
  File? file;
  UploadTask? task;

  @override
  Widget build(BuildContext context) {
    final filename;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('controller.user!.photoURL'),
          ),
        ),
        title: Text('controller.user!.displayName!'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //   loggout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: LayoutBuilder(builder: (context, viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    // Get.to(PurchaseProductView());
                    Get.to(() => MyprofileViewView());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.black87)),
                    child: Text(
                      'Profile',
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // Get.to(PurchaseProductView());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.black87)),
                    child: Text(
                      'Purchase Product',
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // Get.to(WishlistPageView());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.black87)),
                    child: Text('WishList'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue)),
                  height: 50,
                  child: Text('Your Products'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Colors.pink,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            if (FirebaseAuth.instance.currentUser!.uid ==
                                snapshot.data!.docs[index]['uid1']) {
                              var name = snapshot.data!.docs[index]['Adtitle'];
                              var images = snapshot.data!.docs[index]['imgurl'];
                              var sell = snapshot.data!.docs[index]['sell'];
                              var price = snapshot.data!.docs[index]['price'];
                              var category =
                                  snapshot.data!.docs[index]['category'];
                              var proid = snapshot.data!.docs[index].id;

                              return InkWell(
                                onTap: () {
                                  //   Navigator.push(context, MaterialPageRoute(builder: (_)=> profile_product_details()));
                                  Navigator.pushNamed(
                                      context, Routes.PROFILE_PRODUCT_DETAILS,
                                      arguments: {
                                        'name': name,
                                        'images': images,
                                        'sell': sell,
                                        'price': price,
                                        'proid': proid,
                                        'category': category
                                      });
                                },
                                child: Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data!.docs[index]['imgurl'][0]),
                                    ),
                                    title: Text(
                                        snapshot.data!.docs[index]['Adtitle']),
                                  ),
                                ),
                              );
                            } else
                              return Text('');
                          },
                        );
                      }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

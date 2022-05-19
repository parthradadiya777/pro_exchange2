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
import 'package:pro_exchange2/app/routes/app_pages.dart';

import '../../../data/offer.dart';
import '../controllers/profile_page_controller.dart';
import '../edit_profile/views/edit_profile_view.dart';
import '../edit_profile/views/editimage_view.dart';
import '../edit_profile/views/editimage_view.dart';
import 'myprofile_view_view.dart';

class profile_product_details extends StatefulWidget {
  const profile_product_details({Key? key}) : super(key: key);

  @override
  State<profile_product_details> createState() =>
      _profile_product_detailsState();
}

class _profile_product_detailsState extends State<profile_product_details> {
  bool b = true;
  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;
  List<File> _image = [];

  // List<String> imgUrl = [];
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
  var images;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var Adtitle = data['name'];
    // var images = data['images'];
    var sell = data['sell'];
    var price = data['price'];
    var proid = data['proid'];
    var category = data['category'];
    var as;
    var d;

    return Scaffold(
      appBar: AppBar(
        title: Text('Prouct Detail'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          //  color: Colors.pink,
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                final docRef = FirebaseFirestore.instance
                    .collection('products')
                    .doc(proid);
                docRef.get().then((DocumentSnapshot doc) {
                  images = doc['imgurl'] as List;
                  setState(() {});
                });
                return Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  color: Colors.blue,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(5),

                                                  //width: 100,
                                                  height: 20,
                                                  child: Text('verifier: No'))),
                                          Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(5),
                                                  height: 20,
                                                  child: Text('Vote 1',
                                                      textAlign:
                                                          TextAlign.center))),
                                        ],
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Image.network(images[0]),
                                      )),
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        first();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.lightGreenAccent,
                                        width: 150,
                                        child: Text('Details'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        first1();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.lightGreenAccent,
                                        width: 150,
                                        child: Text('Documents'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        first2();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.lightGreenAccent,
                                        width: 150,
                                        child: Text('Gallery'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        first3();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.lightGreenAccent,
                                        width: 150,
                                        child: Text('Voters'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        first5();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.lightGreenAccent,
                                        width: 150,
                                        child: Text('Verifier'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: ()async {
                                       as=await FirebaseFirestore.instance.collection('products').get();
                                       if(as!=null){
                                         d=as['alldeals'];
                                        }
                                       else d='empty';
                                        first6();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.lightGreenAccent,
                                        width: 150,
                                        child: Text('Deals'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                      selected
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            var id = proid;

                                            Navigator.of(context).pushNamed(
                                                Routes.EDIT_PROFILE,
                                                arguments: {
                                                  'category': Adtitle,
                                                  'sell': sell,
                                                  'uid1': id,
                                                });
                                          },
                                          icon: Icon(Icons.edit))
                                    ],
                                  ),
                                  Text('Product Name :${Adtitle}'),
                                  Text('Sell : ${sell}'),
                                ],
                              ),
                            )
                          : selected1
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            print('helo');
                                            final path =
                                                await FlutterDocumentPicker
                                                    .openDocument();
                                            print(path);
                                            file = File(path);

                                            setState(() {
                                              b = true;
                                            });
                                            //  await pdf();
                                          },
                                          icon: Icon(Icons.add)),

                                      b
                                          ? Text(file != null
                                              ? Path.basename(file!.path)
                                              : 'No File')
                                          : Text('Add Another'),

                                      TextButton(
                                          onPressed: () async {
                                            print('hello');

                                            task = await fileupload(file!);
                                            setState(() {
                                              task!.whenComplete(
                                                  () => setState(() {
                                                        b = false;
                                                      }));
                                            });

                                            FirebaseFirestore.instance
                                                .collection('products')
                                                .doc(proid)
                                                .set({
                                              'document': file.toString()
                                            }, SetOptions(merge: true));
                                          },
                                          child: Text('Upload')),
                                      b
                                          ? task != null
                                              ? builduplodstatus(task!)
                                              : Container(
                                                  child: Text('hhh'),
                                                )
                                          : Text(''),
                                      // Text(filename)
                                    ],
                                  ),
                                )
                              : selected2
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Column(
                                        children: [
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.end,
                                          //   children: [
                                          //
                                          //     IconButton(onPressed: (){
                                          //
                                          //       var id= proid;
                                          //       // uploadFile();
                                          //
                                          //     }, icon: Icon(Icons.add))
                                          //   ],
                                          // ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 300,
                                                    color: Colors.purple,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: GridView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              _image.length + 1,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      1),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return index == 0
                                                                ? Center(
                                                                    child: IconButton(
                                                                        icon: Icon(Icons
                                                                            .add),
                                                                        onPressed: () => !uploading
                                                                            ? chooseImage()
                                                                            : null),
                                                                  )
                                                                : Container(
                                                                    margin: EdgeInsets
                                                                        .all(3),
                                                                    decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                            image: FileImage(_image[index -
                                                                                1]),
                                                                            fit:
                                                                                BoxFit.cover)),
                                                                  );
                                                          }),
                                                    ),
                                                  ),
                                                  uploading
                                                      ? Center(
                                                          child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                'uploading...',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            CircularProgressIndicator(
                                                              value: val,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      Colors
                                                                          .green),
                                                            )
                                                          ],
                                                        ))
                                                      : Container(),
                                                ],
                                              ),
                                              Container(
                                                child: InkWell(
                                                  child: Text('save'),
                                                  onTap: () async {
                                                    await uploadFile();
                                                    var id = proid;
                                                    FirebaseFirestore.instance
                                                        .collection('products')
                                                        .doc(id)
                                                        .update({
                                                      'imgurl':
                                                          FieldValue.arrayUnion(
                                                              a)
                                                    }).then((value) =>
                                                            print('sucess'));
                                                    print(
                                                        '++++++++++++++++++++' +
                                                            images.toString());
                                                    setState(() {
                                                      _image.clear();
                                                      a.clear();
                                                    });
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            color: Colors.yellow,
                                            width: 200,
                                            height: 100,
                                            child: Container(
                                                margin: EdgeInsets.all(10),
                                                height: 300,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: images.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            index) {
                                                      return InkWell(
                                                          child: Container(
                                                              height: 300,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              1),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black87)),
                                                              child: Column(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: Container(
                                                                          height: 100,
                                                                          alignment: Alignment.center,
                                                                          color: Colors.grey,
                                                                          child: Row(children: [
                                                                            Container(
                                                                                height: 300,
                                                                                child: Image.network(images[index])),
                                                                            IconButton(
                                                                                onPressed: () async {
                                                                                  print("hello");
                                                                                  var val = [];
                                                                                  var id = proid;
                                                                                  var image = images[index];
                                                                                  val.add(image);
                                                                                  print(val);
                                                                                  print(image);
                                                                                  await FirebaseFirestore.instance.collection('products').doc(id).update({
                                                                                    'imgurl': FieldValue.arrayRemove(val)
                                                                                  }).then((_) {
                                                                                    print('question deleted');
                                                                                  }).catchError((onError) {
                                                                                    print(onError);
                                                                                  });
                                                                                  val = [];

                                                                                  setState(() async {});
                                                                                },
                                                                                icon: Icon(Icons.delete))
                                                                          ])),
                                                                    ),
                                                                  ])));
                                                    })),
                                          ),
                                        ],
                                      ),
                                    )
                                  : selected3
                                      ? Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.19,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Column(
                                            children: [Text('Voters')],
                                          ),
                                        )
                                      : selected4
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.all(10),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.19,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Column(
                                                children: [Text('Verifiers')],
                                              ),
                                            )
                                          : selected5
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding: EdgeInsets.all(10),
                                                  margin: EdgeInsets.all(10),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.19,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.12,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1,
                                                        color: Colors.yellow,
                                                        child: StreamBuilder(
                                                            stream:
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'products')
                                                                    .snapshots(),
                                                            builder: (BuildContext
                                                                    context,
                                                                AsyncSnapshot<
                                                                        QuerySnapshot>
                                                                    snapshot) {
                                                              //    if (!snapshot.hasError) return new Text('Loading...');
                                                              if (snapshot
                                                                  .hasData) {
                                                                final docs =
                                                                    snapshot
                                                                        .data
                                                                        ?.docs;
                                                                return ListView
                                                                    .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        clipBehavior:
                                                                            Clip
                                                                                .hardEdge,
                                                                        itemCount:
                                                                            docs!
                                                                                .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return InkWell(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), border: Border.all(color: Colors.black87)),
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      // Text("${index + 1} :"),
                                                                                      Text(as.toString()),
                                                                                      // Text(snapshot.data!.docs[index]['alldeals']['offer'])
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                              }
                                                              return Center(
                                                                  child:
                                                                      CircularProgressIndicator());
                                                            }),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Text('')
                    ],
                  ),
                );
              })

          //  return Center(child: CircularProgressIndicator());
          ),
    );
  }

  get() {
    imgRef = FirebaseFirestore.instance.collection('products');
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref?.putFile(img).whenComplete(() async {
        await ref?.getDownloadURL().then((value) {
          a.add(value.toString());
          print("helllo");
          print(a);
          imgRef?.add({'url': value});
          i++;
        });
      });
    }
  }

  ///// pdf /////

// Future pdf() async {
// try {
//   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//   print(result);
//   if(result ==null){
//     return;
//   }
//   final path = result.files.single.path;
//   setState(() {
//     file = File(path!);
//
//
//   });
// } on MissingPluginException catch (e) {
//   print(e);
//   // TODO
// }
//
//   }

  //
  //    UploadTask? uplode(String des,Uint8List data){
  //      try {
  //        final ref = FirebaseStorage.instance.ref(des);
  //            return ref.putData(data);
  //      } on FirebaseException catch (e) {
  //        return null;
  //        // TODO
  //      }
  //
  //  }
  //
  //  Future filesuploded() async{
  //    if(file == null){
  //      return;
  //    }
  //    final finename = Path.basename(file!.path);
  //    final des = "files/&$finename";
  //    final id = FirebaseFirestore.instance.collection('products').doc().id;
  //   // task = firebase_storage.FirebaseStorage.instance.ref().child('file/${Path.basename(file!.path)}') as UploadTask?;
  //    task = FirebaseFirestore.instance.collection('products').doc(id).update({'document': des}) as UploadTask?;
  //    setState(() {});
  //    if(task == null){
  //      return;
  //    }
  //    final snapshot = await task!.whenComplete(() => {});
  //    final urldonwn = await snapshot.ref.getDownloadURL();
  //    print('link:$urldonwn');
  //  }
  //
  Widget builduplodstatus(UploadTask task) {
    return StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (c, snapshot) {
          if (snapshot.hasData) {
            snap = snapshot.data;

            progress = snap!.bytesTransferred / snap.totalBytes;
            percentage = (progress * 100).toStringAsFixed(2);

            return b ? Text('$percentage %') : Text('error');
          } else {
            return Text('');
          }
        });
  }

  Future<firebase_storage.UploadTask?> fileupload(File file) async {
    if (file == null) {
      // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Unable to Upload")));
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('files/${Path.basename(file.path)}');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);
    print("done..!");

    return Future.value(uploadTask);
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

import '../../views/profile_page_view.dart';

class EditimageView extends StatefulWidget {
  const EditimageView({Key? key}) : super(key: key);

  @override
  State<EditimageView> createState() => _EditimageViewState();
}

class _EditimageViewState extends State<EditimageView> {
  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;
  List<File> _image = [];
  List<String> imgUrl = [];
  final picker = ImagePicker();

  List<String> a = List<String>.filled(0, '', growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    var images = data['images'];

    var id = data['id'];
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Update'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
       Container(
              height: 250,
              child: ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .snapshots(),
                        builder: (c, snapshot) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                color: Colors.yellow,
                                height: 100,
                                width: 100,
                                child: Image.network(images[index]),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    var val = [];
                                    val.add(images[index]);
                                    await FirebaseFirestore.instance
                                        .collection('products')
                                        .doc(id)
                                        .update(
                                        {
                                          'imgurl': FieldValue.arrayRemove(val)
                                        });
                                    setState(() {
                                      print(val.remove);
                                    });

                                    print('sucess');
                                    print(val);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          );

                        }
                    );
                  }
              )

            //
            //
            // ),



          ),
          MaterialButton(
            onPressed: () async {},
            child: Card(
              child: Container(
                alignment: Alignment.center,
                //color: Colors.yellow,
                height: 50,
                width: 200,
                child: Text('Save'),
              ),
            ),
          ),
        ],
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
          imgRef?.add({'url': value});
          i++;
        });
      });
    }
  }
}

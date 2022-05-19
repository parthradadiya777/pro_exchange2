

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path/path.dart' as Path;

class CarController extends GetxController {
  //TODO: Implement CarController

  final count = 0.obs;

  RxString selected = "abc".obs;
  //var selectedDrowpdown = 'abc';
  RxList dropdownText = ['abc', 'def', 'ghi'].obs;

  TextEditingController carbrad = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController km = TextEditingController();
  TextEditingController price = TextEditingController();



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


  /// Drop Down
  void setSelected(String value){
    selected.value = value;
  }

// Radio Button
  RxString radio1 = "Yes".obs;
  List<String> period = ['Yes', "No"];



void radioSelected(String value){
    radio1.value = value;
}


/// Image picker
//   late List<Uint8List> image;
//   RxString imagePath = ''.obs;
//   final _picker = ImagePicker();
//
//   pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(
//           source: source,
//           maxHeight: 480,
//           maxWidth: 360,
//           imageQuality: 40);
//       // if (image == null) return;
//       if (image != null) {
//         imagePath.value = image.path;
//       }
//       //return imagePath.value;
//       // final imageTemporary = File(;image.path);
//       // setState(() {
//       //   this.image = imageTemporary;
//       // });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }
//    List<RxString>? list1;
//   RxString imagePath = ''.obs;
//   pickImage(ImageSource source) async {
//     try {
//       final list = await ImagePicker().pickMultiImage(
//           maxHeight: 480,
//           maxWidth: 360,
//           imageQuality: 40);
//       // if (image == null) return;
//       if (list != null) {
//         imagePath.value = list as String;
//       }
//       //return imagePath.value;
//       // final imageTemporary = File(;image.path);
//       // setState(() {
//       //   this.image = imageTemporary;
//       // });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }
//   late XFile image;
//   RxString imagePath = ''.obs;
//   final _picker = ImagePicker();
//
//   pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(
//           source: source,
//           maxHeight: 480,
//           maxWidth: 360,
//           imageQuality: 40);
//       // if (image == null) return;
//       if (image != null) {
//         imagePath.value = image.path;
//       }
//       //return imagePath.value;
//       // final imageTemporary = File(;image.path);
//       // setState(() {
//       //   this.image = imageTemporary;
//       // });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

  // List imagefiles=List.empty(growable: true);
  // // RxString imagePath = ''.obs;
  // // var selectedImagePath = ''.obs;
  // void getImage1() async {
  //   try {
  //     final pickedFile = await ImagePicker().pickMultiImage();
  //     print(pickedFile![0]);
  //     if (pickedFile != null) {
  //       for(int i=0;i<3;i++) {
  //         imagefiles[i] = pickedFile[i].path;
  //       }
  //     } else {
  //       print("No image selected");
  //     }
  //   } on Exception catch (e) {
  //     print(e.toString());
  //     // TODO
  //   }
  // }
  //
  // void deleteImage(){
  //
  //   imagefiles.clear();
  //
  // }
//      Uint8List? image;
//   RxString imagePath = ''.obs;
//  //late Uint8List image;
// // late Uint8List imagePath;
//   final picker = ImagePicker();
//
//   pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(
//           source: source,
//           maxHeight: 480,
//           maxWidth: 360,
//           imageQuality: 40);
//       // if (image == null) return;
//       if (image != null) {
//         imagePath = image.path as RxString;
//       }
//       //return imagePath.value;
//       // final imageTemporary = File(;image.path);
//       // setState(() {
//       //   this.image = imageTemporary;
//       // });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }
// ImagePicker picker = ImagePicker();
//  List<File> image = [];
// choseImage() async {
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   image.add(File('${pickedFile?.path}'));
//   if (pickedFile!.path == null) {
//     retrieveLostData();
//   }
// // }
// Future<void> retrieveLostData() async{
//   final LostData responce = (await picker.retrieveLostData()) as LostData;
//   if(responce.isEmpty){
//     return;
//   }
//   if(responce.file !=null){
//     image.add(File('${responce.file?.path}'));
//   }
//   else{
//     print(responce.file);
//   }
//
//
// }
//


// Future<List<String>> upload(List imagefiles )async{
//     List<String> img=[];
//
//     imagefiles.forEach((_image)async {
//       FirebaseStorage storage = FirebaseStorage.instance;
//
//      // FirebaseStorage  reference = FirebaseStorage.instance.ref().child('image${_image.path}');
//       Reference reference = FirebaseStorage.instance.ref().child('image${_image.path}');
//       UploadTask uploadTask = reference.putFile(_image);
//       await uploadTask.resume();
//
// img.add(await reference.getDownloadURL());
//
//     });
//     print(img);
//     return img;
//
// }

  String error = 'No Error Detected';

  List<Asset> imagesList = <Asset>[].obs;
  void getImages() async{
    List<Asset> resultList = <Asset>[].obs;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: imagesList,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    update();
  }

Widget buildGridView() {
  return GridView.count(
    crossAxisCount: 3,
    children: List.generate( imagesList.length, (index) {
      Asset asset = imagesList[index];
      return AssetThumb(
        asset: asset,
        width: 300,
        height: 300,

      );
    }),
  );
}

  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  List<File> image = [];
  final picker = ImagePicker();

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

      image.add(File(pickedFile!.path));

    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {

        image.add(File(response.file!.path));

    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in image) {

        val = i / image.length;

      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
          i++;
        });
      });
    }
  }
























}

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_exchange2/app/data/becomeVerifier.dart';
import 'package:resize/resize.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class BecomeVerifier extends StatefulWidget {
  @override
  State<BecomeVerifier> createState() => _BecomeVerifierState();
}

class _BecomeVerifierState extends State<BecomeVerifier> {


  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController companydetails = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController email = TextEditingController();


  String latitude ='Null, Press Button';
  String Address = 'No Address';


  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks);
      Placemark place = placemarks[0];
      Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      setState(()  {
      });
    } on MissingPluginException catch (e) {
      print(e);
    }
  }

  String detail = "Company";

  List details = ['Company','Freelance'];

  void detailsSelected(String value){
    setState(() {
      detail = value;
    });
  }
  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<File> _image = [];
  List<String> imgUrl = [];
  final picker = ImagePicker();
  List<String> a =List<String>.filled(0, '',growable: true);



  String category = "car";

  List categories = ['car','furrniture','mobile','bikes','house & appartment','site & plots','printer & moniters','washing machine','fridge','tv,audio','camera','computer & leptop','others'];
  void categoriesSelected(String value){
    setState(() {
      category = value;
    });
  }

  cleartext(){
    name.clear();
    age.clear();
    address.clear();
    phonenumber.clear();
    companydetails.clear();
    experience.clear();
    email.clear();
    a.clear();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Become A Verifier'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                   controller:name ,
                decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                   controller: age,
                decoration: InputDecoration(
                    hintText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  controller:address ,
                decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                   controller:phonenumber ,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              // width: width(context)*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),

              ),
              child:  DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text("Select"),
                    value: detail as String,
                    onChanged: (newValue) {

                      detailsSelected(newValue!);
                    },
                    items: details
                        .map((fc) => DropdownMenuItem<String>(
                      child: Text(fc),
                      value: fc,
                    ))
                        .toList()),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  controller: companydetails,
                decoration: InputDecoration(
                    hintText: 'Details',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              // width: width(context)*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),

              ),
              child:  DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    isExpanded: true,

                    value: category as String,
                    onChanged: (newValue) {

                      categoriesSelected(newValue!);
                    },
                    items: categories
                        .map((fc) => DropdownMenuItem<String>(
                      child: Text(fc),
                      value: fc,
                    ))
                        .toList()),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  controller:experience ,
                decoration: InputDecoration(
                    hintText: 'Experience',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  controller:email ,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            Column(
              children: [
                Container(
                  height: 150,
                  width: 400,
                  color: Colors.purple,
                  child:           Container(
                    padding: EdgeInsets.all(4),
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _image.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:1),
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Center(
                            child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () =>
                                !uploading ? chooseImage() : null),
                          )
                              : Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(_image[index - 1]),
                                    fit: BoxFit.cover)),
                          );

                        }),

                  ),

                ),
                uploading
                    ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            'uploading...',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: val,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        )
                      ],
                    ))
                    : Container(),
              ],
            ),
            InkWell(
              onTap: (){
                setState(() {});
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    // SizedBox(height: 10,),
                    // Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
                    // SizedBox(height: 10,),
                    ElevatedButton(onPressed: () async{
                      Position position = await _getGeoLocationPosition();
                      latitude='Lat: ${position.latitude} , Long: ${position.longitude}';
                      GetAddressFromLatLong(position);

                    }, child: Text('Get Location')),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(top: 10,left: 5,right: 5),

                      height: 60,width: 200,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Text('$Address'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () async{
            await uploadFile();
            BecomeVerifierStoreData().BecomeVeriferData1(name.text, age.text, address.text, phonenumber.text, detail, companydetails.text, category,experience.text, email.text, a, _auth.currentUser!.uid, 'Verifier',Address , latitude, 'V');
               cleartext();
              },
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
      ),
    );
  }


  get(){
    imgRef = FirebaseFirestore.instance
        .collection('products');

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

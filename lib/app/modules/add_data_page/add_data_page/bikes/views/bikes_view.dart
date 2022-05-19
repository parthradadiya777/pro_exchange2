import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pro_exchange2/app/data/bikesData.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
import 'package:pro_exchange2/app/data/furnitureData.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
import 'package:resize/resize.dart';


class BikesView extends StatefulWidget {
  const BikesView({Key? key}) : super(key: key);

  @override
  State<BikesView> createState() => _BikesViewState();
}

class _BikesViewState extends State<BikesView> {
  String latitude = 'Null, Press Button';
  String Address = 'No Address';
  bool flag = false;

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
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks);
      Placemark place = placemarks[0];
      Address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      setState(() {});
    } on MissingPluginException catch (e) {
      print(e);
    }
  }

  TextEditingController year = TextEditingController();
  TextEditingController km = TextEditingController();
  TextEditingController Adtitle = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

//
  String Bikebrand = "abc";
  List Bikebrands = ['abc', 'def', 'ghi'];

  void BikebrandSelected(String value) {
    setState(() {
      Bikebrand = value;
    });
  }

  ///
  String biding = "Sell";

  //var selectedDrowpdown = 'abc';
  List bids = [
    'Sell',
    'Bid',
    'Exchange',
  ];

  void bidsselected(String value) {
    setState(() {
      biding = value;
    });
  }

  CollectionReference? imgRef;
  firebase_storage.Reference? ref;
  List<File> _image = [];
  List<String> imgUrl = [];
  final picker = ImagePicker();
  bool uploading = false;
  double val = 0;
  List<String> a = List<String>.filled(0, '', growable: true);
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isdata = false;

  void cleartext() {
    year.clear();
    km.clear();
    Adtitle.clear();
    description.clear();
    price.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bikes'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                // width: width(context)*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Select"),
                      value: Bikebrand as String,
                      onChanged: (newValue) {
                        BikebrandSelected(newValue!);
                      },
                      items: Bikebrands.map((fc) => DropdownMenuItem<String>(
                            child: Text(fc),
                            value: fc,
                          )).toList()),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                child: TextFormField(
                  controller: km,
                  decoration: InputDecoration(
                    hintText: 'Km Driven',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                child: TextFormField(
                  controller: year,
                  decoration: InputDecoration(
                    hintText: 'Year',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                child: TextFormField(
                  controller: Adtitle,
                  decoration: InputDecoration(
                    hintText: 'Adtitle',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                child: TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    hintText: 'description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 150.h,
                    width: 400.w,
                    color: Colors.purple,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _image.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1),
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
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            )
                          ],
                        ))
                      : Container(),
                ],
              ),
              InkWell(
                onTap: () {
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
                      ElevatedButton(
                          onPressed: () async {
                            Position position = await _getGeoLocationPosition();
                            latitude =
                                'Lat: ${position.latitude} , Long: ${position.longitude}';
                            GetAddressFromLatLong(position);
                          },
                          child: Text('Get Location')),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                        height: 60,
                        width: 200,
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
              Container(
                padding: EdgeInsets.all(10.h),
                child: TextFormField(
                  controller: price,
                  decoration: InputDecoration(
                    hintText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                // width: width(context)*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Select"),
                      value: biding as String,
                      onChanged: (newValue) {
                        bidsselected(newValue!);
                      },
                      items: bids
                          .map((fc) => DropdownMenuItem<String>(
                                child: Text(fc),
                                value: fc,
                              ))
                          .toList()),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  flag = true;
                  await uploadFile();

                  BikesStoreData()
                      .BikesData1(
                          Bikebrand,
                          year.text,
                          km.text,
                          Adtitle.text,
                          description.text,
                          a,
                          biding,
                          price.text,
                          _auth.currentUser!.uid,
                          'Bikes',
                          Address,
                          latitude,
                          'B')
                      .whenComplete(() {
                    setState(() {
                      flag = false;
                      setState(() {
                        cleartext();
                        a.clear();
                        Address='';
                        Navigator.pop(context);
                      });

                    });
                  });


    print(isdata);
                },
                child: Card(

                child:   Column(
                    children: [
                      flag
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              alignment: Alignment.center,
                              //color: Colors.yellow,
                              height: 50.h,
                              width: 200.w,
                              child: Text('Save'),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
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


import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/google_maps/views/google_maps_view.dart';
import 'package:resize/resize.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import '../../../../../Colors/Colors.dart';
import '../controllers/car_controller.dart';

class CarView extends StatefulWidget {
  @override
  _CarViewState createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  String latitude = 'Null, Press Button';
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

  TextEditingController carbrad = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController km = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController location1 = TextEditingController();

  String selected = "abc";
  List dropdownText = ['abc', 'def', 'ghi'];

  void setSelected(String value) {
    setState(() {
      selected = value;
    });
  }

  //var selectedDrowpdown = 'abc';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String radio1 = 'Yes';
  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;
  List<File> _image = [];
  List<String> imgUrl = [];
  final picker = ImagePicker();

  List<String> a = List<String>.filled(0, '', growable: true);

// Sell
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

  void cleartext() {
    carbrad.clear();
    model.clear();
    year.clear();
    state.clear();
    km.clear();
    price.clear();
    location1.clear();
  }

  late Position _currentPosition;
  String _currentAddress = '';
  Set<Marker> markers = {};
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    CarController carController = CarController();
    Get.lazyPut(() => CarController());
    bool flag = false;
    return Resize(builder: () {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Add car details'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 90.vh,
                          width: 80.vw,
                          child: ListView(
                            children: [
                              Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: TextFormField(
                                        controller: carbrad,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'Car brand',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.h),
                                      child: TextFormField(
                                        controller: model,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'Car Model',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 20.vw,
                                      child: FittedBox(
                                        child: Text(
                                          'FuelType:',
                                          style: TextStyle(color: textColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 50.vw,
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),

                                      // width: width(context)*1,

                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                            color: textColor, width: 1),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                            isExpanded: true,
                                            hint: Text("Select"),
                                            value: selected as String,
                                            onChanged: (newValue) {
                                              setSelected(newValue!);
                                            },
                                            items: dropdownText
                                                .map((fc) =>
                                                    DropdownMenuItem<String>(
                                                      child: Text(fc),
                                                      value: fc,
                                                    ))
                                                .toList()),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      child: TextFormField(
                                        controller: year,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'Year purchased',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      child: TextFormField(
                                        controller: state,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'Registered State',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      child: TextFormField(
                                        controller: km,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'Kilometers Driven',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      width: 20.vw,
                                      child: FittedBox(
                                        child: Text(
                                          'Insurance:',
                                          style: TextStyle(color: textColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      width: 50.vw,
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),

                                      // width: width(context)*1,

                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                            color: textColor, width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Obx(() => Radio<String>(
                                                value: 'Yes',
                                                groupValue:
                                                    carController.radio1.value,
                                                onChanged: (val) {
                                                  carController
                                                      .radioSelected(val!);
                                                },
                                              )),
                                          Text('Yes'),
                                          Obx(() => Radio(
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black87),
                                                activeColor: Colors.blue,
                                                value: "No",
                                                groupValue:
                                                    carController.radio1.value,
                                                onChanged: (val) {
                                                  carController.radioSelected(
                                                      val as String);
                                                },
                                              )),
                                          Text('No'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      child: TextFormField(
                                        controller: location1,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'Address',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /////////////////////
                                    Container(
                                      width: 20.vw,
                                      child: FittedBox(
                                        child: Text(
                                          'Add Images:',
                                          style: TextStyle(color: textColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
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
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: _image.length + 1,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 1),
                                                itemBuilder: (context, index) {
                                                  return index == 0
                                                      ? Center(
                                                          child: IconButton(
                                                              icon: Icon(
                                                                  Icons.add),
                                                              onPressed: () =>
                                                                  !uploading
                                                                      ? chooseImage()
                                                                      : null),
                                                        )
                                                      : Container(
                                                          margin:
                                                              EdgeInsets.all(3),
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: FileImage(
                                                                      _image[
                                                                          index -
                                                                              1]),
                                                                  fit: BoxFit
                                                                      .cover)),
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
                                                      style: TextStyle(
                                                          fontSize: 20),
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
                                                            Colors.green),
                                                  )
                                                ],
                                              ))
                                            : Container(),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 7.vw,
                                      child: FittedBox(
                                        child: Text(
                                          'For:',
                                          style: TextStyle(color: textColor),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      // width: width(context)*1,
                                      width: 50.vw,
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      // width: width(context)*1,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                            color: textColor, width: 1),
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
                                                .map((fc) =>
                                                    DropdownMenuItem<String>(
                                                      child: Text(fc),
                                                      value: fc,
                                                    ))
                                                .toList()),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      child: TextFormField(
                                        controller: price,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'Price',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    /////
                                    InkWell(
                                      onTap: () {
                                        setState(() {});
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                            // SizedBox(height: 10,),
                                            // Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
                                            // SizedBox(height: 10,),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  Position position =
                                                      await _getGeoLocationPosition();
                                                  latitude =
                                                      'Lat: ${position.latitude} , Long: ${position.longitude}';
                                                  GetAddressFromLatLong(
                                                      position);
                                                },
                                                child: Text('Get Location')),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 5, right: 5),
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
                                      margin: EdgeInsets.only(top: 10.h),
                                      padding: EdgeInsets.all(10.h),
                                      child: TextFormField(
                                        controller: price,
                                        decoration: InputDecoration(
                                            hintText: 'Price',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r))),
                                      ),
                                    ),
                                    /////
                                    MaterialButton(
                                      onPressed: () async {
                                        await uploadFile();
                                        CarStoreData()
                                            .saveData(
                                                carbrad.text,
                                                model.text,
                                                selected,
                                                year.text,
                                                state.text,
                                                km.text,
                                                radio1,
                                                price.text,
                                                a,
                                                _auth.currentUser!.uid,
                                                location1.text,
                                                'Car',
                                                biding,
                                                Address,
                                                latitude,
                                                'C'

                                                //get()
                                                )
                                            .whenComplete(() {
                                          setState(() {
                                            flag = false;
                                            setState(() {
                                              cleartext();
                                              a.clear();
                                              Address = '';
                                              Navigator.pop(context);
                                            });
                                          });
                                        });
                                        ;
                                        a.clear();
                                        cleartext();
                                        //  .then((value) => Get.to(() => AddImage()));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        //color: Colors.yellow,
                                        decoration: BoxDecoration(
                                          color: textColor,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                              color: textColor, width: 1),
                                        ),

                                        height: 15.vw,
                                        width: 50.vw,
                                        child: flag
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : Container(
                                                alignment: Alignment.center,
                                                //color: Colors.yellow,
                                                height: 50.h,
                                                width: 200.w,
                                                child: Text('Save'),
                                              ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
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

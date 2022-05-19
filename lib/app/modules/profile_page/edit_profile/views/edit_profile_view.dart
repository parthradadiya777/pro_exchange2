import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/add_data_page/furniture/views/furniture_view.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  var selected;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    var category = data['category'];
    var sell = data['sell'];
    var uid1 = data['uid1'];
    print(uid1);
    TextEditingController name = TextEditingController(text: category);
    return Scaffold(
        appBar: AppBar(
          title: Text('EditProfile'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              //  color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,

              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    fillColor: Colors.blue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Product Name'),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (c, snapshot) {
                  return DropdownButton(
                    value: selected == null ? sell : selected,
                    onChanged: (v) {
                      setState(() {
                        selected = v;
                      });
                    },
                    items: bids.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                  );
                  /*snapshot.data!.docs.map((DocumentSnapshot document) {
                        return DropdownMenuItem(
                          value: document['sell'],
                          child: Text(document['sell']),
                        );
                      }).toList(),*/
                }),
            MaterialButton(
              onPressed: () async {
                var firebasseauth = FirebaseAuth.instance.currentUser!.uid;
                FirebaseAuth _auth = FirebaseAuth.instance;
                // var id =
                //     FirebaseFirestore.instance.collection('poducts');
                // print(firebasseauth);
                // print(id);

                FirebaseFirestore.instance
                    .collection('products')
                    .doc(uid1)
                    .update({
                  'Adtitle': name.text,
                }).catchError((e) {
                  print(e.toString());
                });
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
        ));
  }
}

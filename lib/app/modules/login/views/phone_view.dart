import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/login/views/phoneverify.dart';

class PhoneView extends GetView {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();

  var uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PhoneView'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phone,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  if (phone.text != null) {
                    final v = '+91' + phone.text;
                    await AuthProvider().loginwithphone(context, v, name.text);
                  }
                },
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    //color: Colors.yellow,
                    height: 50,
                    width: 200,
                    child: Text('Verify'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

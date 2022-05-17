import 'package:flutter/material.dart';
import 'package:pro_exchange2/app/modules/verifiers/views/BecomeVerifier.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            //   drawer: Drawerpage(),
            //  semanticLabel: 'Drawer',
            child: ListView(children: [
      Column(
        children: [
        TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: ((_)=> BecomeVerifier())));
        }, child: Text('Become A Verifier')),
          TextButton(onPressed: (){}, child: Text('How to Become A Verifier')),

        ],
      )
    ])));
  }
}

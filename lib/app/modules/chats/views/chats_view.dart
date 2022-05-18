import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
import '../../../../Colors/Colors.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isthere = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Chats',
      //     // title: Image.asset(
      //     //   "assets/images/logo.png",
      //     //   height: 40,
      //   ),
      //   elevation: 0.0,
      //   centerTitle: true,
      // ),
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       // AuthService().signOut();
        //       // Navigator.pushReplacement(context,
        //       //     MaterialPageRoute(builder: (context) => Authenticate()));
        //     },
        //     child: Container(
        //         padding: EdgeInsets.symmetric(horizontal: 16),
        //         child: Icon(Icons.exit_to_app)),
        //   )
        // ],
      body: Container(
        child: chatRoomsList(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.search),
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => Search()));
      //   },
      // ),
    );
  }
  Widget chatRoomsList() {
    return SafeArea(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('user').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final docs = snapshot.data?.docs;
              return LayoutBuilder(
                builder: (BuildContext context,BoxConstraints viewportConstraints){
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Container(
                              color: textColor,
                              height: MediaQuery.of(context).size.height*0.12,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: docs!.length,
                                  itemBuilder: (context, index) {
                                    if(index==0){
                                      return Container(margin: EdgeInsets.only(left: 10,right: 10),child: CircleAvatar(child: Icon(Icons.search),backgroundColor: white),);
                                    }else
                                    return Container(

                                      margin: EdgeInsets.only(left: 10,right: 10),
                                      child: CircleAvatar(

                                        backgroundColor: white,
                                      child: CircleAvatar(
                                    backgroundColor: white,
                                    /*backgroundImage: NetworkImage(snapshot
                                        .data!.docs[index]
                                    ['imgurl'][0]),*/
                                      ),
                                    ),
                                    );
                                  }
                              ),
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: MediaQuery.of(context).size.height*.7,
                                      width: MediaQuery.of(context).size.width*0.95,
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          clipBehavior: Clip.hardEdge,
                                          itemCount: docs.length,
                                          itemBuilder: (context, index) {
                                            final data = docs[index].data();
                                            return Container(
                                              height: 50,
                                              child: InkWell(
                                                onTap: (){
                                                  Get.toNamed(Routes.CHAT_PAGE,arguments: snapshot.data!.docs[index]['email']);
                                                },
                                                child: Card(
                                                  elevation: 3,
                                                  shadowColor: textColor,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        child: CircleAvatar(
                                                          backgroundColor: textColor,
                                                          /*backgroundImage: NetworkImage(snapshot
                                                              .data!.docs[index]
                                                          ['imgurl'][0]),*/),
                                                        ),

                                                      Container(
                                                        padding: EdgeInsets.only(left: 10,right: 10),
                                                        child: isthere
                                                          ?Text(snapshot.data!.docs[index]['name'],style: TextStyle(fontWeight: FontWeight.bold))
                                                            // ? Text('for : ' + snapshot.data!.docs[index]['sell'],style: TextStyle(fontWeight: FontWeight.bold),)
                                                            : Text('All'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

              );
            } else
              return Container(
                child: Text('data fetching...'),
              );
          }),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  late final String Category;
  late final String Price;

  // ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        // builder: (context) => Chat(
        // chatRoomId: chatRoomId,
        // )
        // ));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  // color: CustomTheme.colorAccent,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(Category,
                  // child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text("123",
                // Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}

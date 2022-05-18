import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../../Colors/Colors.dart';
import '../../../data/chatData.dart';
import '../controllers/chat_page_controller.dart';

class ChatPageView extends StatefulWidget {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  State<ChatPageView> createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  firebase_storage.Reference? ref;
  bool uploading = false;
  double val = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _controller = TextEditingController();
  final ChatPageController _chatPageController = ChatPageController();
  @override
  String message = "";
  String chatpath = "";
  String peerName = Get.arguments;
  String? currentName = FirebaseAuth.instance.currentUser!.email;

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    // String time= "10";
    String time = DateTime.now().toString();
    String userFrom = _auth.currentUser!.uid;
    if (currentName.hashCode <= peerName.hashCode) {
      chatpath = '$currentName-$peerName';
    } else {
      chatpath = '$peerName-$currentName';
    }

    ChatStoreData().ChatsData1(message, userFrom, time, chatpath);
  }

  @override
  Widget build(BuildContext context) {
    if (currentName.hashCode <= peerName.hashCode) {
      chatpath = '$currentName-$peerName';
    } else {
      chatpath = '$peerName-$currentName';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatPageView'),
        centerTitle: true,
        backgroundColor: textColor,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .95,
          height: MediaQuery.of(context).size.height * .9,
          child: SingleChildScrollView(
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(child: Text('hello')),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: 200,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('chats')
                                .doc(chatpath)
                                .collection(chatpath)
                                .orderBy('time', descending: true)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              //    if (!snapshot.hasError) return new Text('Loading...');
                              final docs = snapshot.data;
                              print(docs!.docs);
                              return docs.docs.isEmpty
                                  ? Text('Say Hi')
                                  : ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      reverse: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: docs.docs.length,
                                      itemBuilder: (context, index) {
                                        final data = docs.docs[index];
                                        return Container(
                                          alignment: _auth.currentUser!.uid ==
                                                  docs.docs[index]['userFrom']
                                              ? Alignment.topRight
                                              : Alignment.topLeft,
                                          child:
                                              Text(docs.docs[index]['message']),
                                        );
                                      });
                            }),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              // textCapitalization: TextCapitalization.sentences,
                              // autocorrect: true,
                              // enableSuggestions: true,
                              decoration: InputDecoration(
                                // filled: true,
                                fillColor: backGround,
                                labelText: 'type your message',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0),
                                  gapPadding: 10,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onChanged: (value) => setState(() {
                                message = value;
                              }),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: textColor,
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: white,
                                ),
                                onPressed: () {
                                  message = _controller.text;
                                  print(message);
                                  message.isEmpty ? null : sendMessage();
                                  _controller.clear();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

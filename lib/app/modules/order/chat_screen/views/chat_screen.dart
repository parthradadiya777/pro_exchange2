import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/order/chat_screen/controllers/chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Chat Screen '),),
    );
  }
}
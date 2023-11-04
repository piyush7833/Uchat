import 'package:flutter/material.dart';
import 'package:ourchat/components/chat_list.dart';
import 'package:ourchat/components/chat_nav.dart';
import 'package:ourchat/components/mobile_message_input_box.dart';
import 'package:ourchat/utils/info.dart';
import 'package:ourchat/utils/colors.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                info[0]['profilePic'].toString(),
              ),
              maxRadius: 15,
            ),
          ],
        ),
        leadingWidth: 35.0,
        backgroundColor: appBarColor,
        title: Text(info[0]['name'].toString()),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.grey,
          ),
        ],
      ),
      body: const Column(
        children: [
          ChatNav(widthScale: 1),
          Expanded(
            child: ChatList(),
          ),
          MobileMessageInputBox(),
        ],
      ),
    );
  }
}

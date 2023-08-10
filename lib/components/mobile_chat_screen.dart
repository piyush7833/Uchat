import 'package:flutter/material.dart';
import 'package:ourchat/components/chat_list.dart';
import 'package:ourchat/components/chat_nav.dart';
import 'package:ourchat/utils/info.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(
        //     info[0]['profilePic'].toString(),
        //   ),
        //   maxRadius: 10,
        // ),

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
      body: const Column(children: [
        ChatNav(
          widthScale: 1,
        ),
        Expanded(child: ChatList()),
        MobileChatScreen()
      ]),
    );
  }
}

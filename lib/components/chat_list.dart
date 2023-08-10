import 'package:flutter/material.dart';
import 'package:ourchat/components/sender_message_card.dart';
import 'package:ourchat/components/user_message_card.dart';
import 'package:ourchat/utils/info.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          if (messages[index]["isMe"] == true) {
            return UserMessageCard(
                date: messages[index]["time"].toString(),
                message: messages[index]["text"].toString());
          } else {
            return SenderMessageCard(
                date: messages[index]["time"].toString(),
                message: messages[index]["text"].toString());
          }
        });
  }
}

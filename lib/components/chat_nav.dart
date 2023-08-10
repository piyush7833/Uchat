import 'package:flutter/material.dart';
import 'package:ourchat/utils/colors.dart';

class ChatNav extends StatelessWidget {
  final double widthScale;
  const ChatNav({super.key, required this.widthScale});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.077,
        width: MediaQuery.of(context).size.width * widthScale,
        decoration: const BoxDecoration(
          color: Colors.black26,
        ),
        child: const TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Text("Chats"),
              Text("Photos"),
              Text("Videos"),
              Text("Reminders"),
            ]),
      ),
    );
  }
}

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
        child: TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Container(
                  height: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text(
                    "Chats",
                  )),
              Container(
                  height: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text(
                    "Photos",
                  )),
              Container(
                  height: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text(
                    "Videos",
                  )),
              Container(
                  height: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text(
                    "Reminders",
                  )),
            ]),
      ),
    );
  }
}

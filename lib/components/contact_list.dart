import 'package:flutter/material.dart';
import 'package:ourchat/components/mobile_chat_screen.dart';
import 'package:ourchat/utils/colors.dart';
import 'package:ourchat/utils/info.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: ListView.separated(
        itemCount: info.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return (const Divider(
            color: dividerColor,
            indent: 85,
          )); //it is used to provide divide like hr in web //rarely used
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobileChatScreen(),
                  ));
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(info[index]["profilePic"].toString()),
                radius: 30,
              ),
              title: Text(info[index]["name"].toString(),
                  style: const TextStyle(fontSize: 18)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  info[index]["message"].toString(),
                  style: const TextStyle(fontSize: 15, color: messageColor),
                ),
              ),
              trailing: Text(info[index]["time"].toString(),
                  style: const TextStyle(fontSize: 13, color: messageColor)),
            ),
          );
        },
      ),
    );
  }
}

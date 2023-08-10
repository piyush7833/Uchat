import 'package:flutter/material.dart';
import 'package:ourchat/utils/colors.dart';

class MobileMessageInputBox extends StatelessWidget {
  const MobileMessageInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: dividerColor)),
        color: chatBarMessage,
      ),
      child: const TextField(
          decoration: InputDecoration(
        fillColor: searchBarColor,
        filled: true,
        hintText: "Type a Message",
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.grey,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.camera_alt,
                color: Colors.grey,
              ),
              Icon(
                Icons.attach_file,
                color: Colors.grey,
              ),
              Icon(
                Icons.money_rounded,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
                width: 0, style: BorderStyle.none, color: Colors.blue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(width: 0, color: Colors.green)),
        contentPadding: EdgeInsets.only(left: 10.0),
      )),
    );
  }
}

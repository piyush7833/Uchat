import 'package:flutter/material.dart';
import 'package:ourchat/utils/colors.dart';

class WebMessageInputBox extends StatelessWidget {
  const WebMessageInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: dividerColor)),
        color: chatBarMessage,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.emoji_emotions_outlined),
          color: Colors.grey,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.attach_file),
          color: Colors.grey,
        ),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 15),
          child: TextField(
            decoration: InputDecoration(
                fillColor: searchBarColor,
                filled: true,
                hintText: "Type a Message",
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
                contentPadding: EdgeInsets.only(left: 20.0)),
          ),
        )),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.mic),
          color: Colors.grey,
        ),
      ]),
    );
  }
}

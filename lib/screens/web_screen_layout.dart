import 'package:flutter/material.dart';
import 'package:ourchat/components/contact_list.dart';
import 'package:ourchat/components/web_search_bar.dart';
import 'package:ourchat/components/web_profile_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [WebProfileBar(), WebSearchBar(), ContactList()],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/chatScreenBackground.png"),
                  fit: BoxFit.cover)),
          child: const Column(children: [
            //web chat bar
            //chat list
            //message input box
          ]),
        )
      ],
    ));
  }
}

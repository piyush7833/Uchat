import 'package:flutter/material.dart';
import 'package:ourchat/utils/colors.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(
            color: dividerColor,
          )),
          color: appBarColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://pbs.twimg.com/profile_images/1419974913260232732/Cy_CUavB.jpg"),
            radius: 20,
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width *
          //       0.15, //it works but when it gets resized it will case overflow error
          // ),

          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

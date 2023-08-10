import 'package:flutter/material.dart';
import 'package:ourchat/utils/colors.dart';

class SenderMessageCard extends StatelessWidget {
  final String message;
  final String date;
  const SenderMessageCard({Key? key, required this.date, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: senderMessageColor,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 30.0, top: 5.0, bottom: 20.0),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Positioned(
                    bottom: 4,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.done_all,
                          size: 20,
                          color: Colors.white60,
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

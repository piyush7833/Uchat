import 'package:flutter/material.dart';
import 'package:ourchat/utils/colors.dart';

class ErrorScreen extends StatelessWidget {
  final String errorText;

  const ErrorScreen({
    Key? key,
    required this.errorText, //constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText),
    );
  }
}

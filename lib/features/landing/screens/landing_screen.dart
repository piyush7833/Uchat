import 'package:flutter/material.dart';
import 'package:ourchat/components/partials/customButton.dart';
import 'package:ourchat/features/auth/screens/auth.dart';
import 'package:ourchat/main.dart';
import 'package:ourchat/utils/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToAuth(BuildContext context) =>
      {Navigator.pushNamed(context, Auth.routeName)};
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Welcome to ConvoSync",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: size.height / 9),
          Image.asset(
            'assets/images/landing_bg.png',
            height: 340,
            width: 340,
            color: tabColor,
          ),
          SizedBox(height: size.height / 9),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
              style: TextStyle(color: greyColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width * 0.75,
            child: CustomButton(
                text: "AGREE AND CONTINUE",
                onPressed: () => {navigateToAuth(context)}),
          )
        ],
      ),
    )));
  }
}

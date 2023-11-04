import 'package:flutter/material.dart';
import 'package:ourchat/components/partials/errorScreen.dart';
import 'package:ourchat/features/auth/screens/auth.dart';
import 'package:ourchat/features/auth/screens/otp_screen.dart';
import 'package:ourchat/features/auth/screens/user_info.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Auth.routeName:
      return MaterialPageRoute(builder: (context) => const Auth());
    case OtpScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OtpScreen(
                verificationId: verificationId,
              ));
    case UserInformation.routeName:
      return MaterialPageRoute(builder: (context) => const UserInformation());
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(errorText: "This page doesn't exist"),
              ));
  }
}

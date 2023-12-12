import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ourchat/components/partials/repositories/common_firebase_storage.dart';
import 'package:ourchat/components/partials/utils.dart';
import 'package:ourchat/features/auth/screens/otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourchat/features/auth/screens/user_info.dart';
import 'package:ourchat/models/user_model.dart';
import 'package:ourchat/screens/mobile_screen_layout.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          Navigator.pushNamed(context, OtpScreen.routeName,
              arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (err) {
      showSnackBar(context: context, content: err.message!);
    }
  }

  void verifyOtp(
      {required BuildContext context,
      required String verificationId,
      required String userOtp}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      var s = await auth.signInWithCredential(credential);
      print("phone auth piyush");
      print(s);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformation.routeName, (route) => false);
    } on FirebaseAuthException catch (err) {
      print(err);
      // showSnackBar(context: context, content: err.message!);
    }
  }

  void saveUserDataToFirebase(
      {required name,
      required File? profilePic,
      required ProviderRef ref,
      required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          "https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small/default-avatar-profile-icon-of-social-media-user-vector.jpg";
      if (profilePic != null) {
        photoUrl =
            await ref.read(commonFirebaseStorageProvider).storeFileToFirebase(
                  'profilePic/',
                  profilePic,
                );
        print(photoUrl);
      }
      var user = UserModel(
          name: name,
          uid: uid,
          profilePic: photoUrl,
          isOnline: true,
          phoneNumber: auth.currentUser!.uid,
          groupId: []);
      await firestore.collection('users').doc(uid).set(user
          .toMap()); //find user and store the data if no user is their it will create
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MobileScreenLayout()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }
}

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ourchat/features/auth/repository/auth_repo.dart';

//provide auth controller to screen to use auth provider

//all the providers should be global
final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider); //provider.of contex
  return AuthController(authRepository: authRepository, ref: ref);
});

class AuthController {
  final AuthRepository
      authRepository; //to make it independent of other classses
  final ProviderRef ref;
  AuthController({required this.authRepository, required this.ref});

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOtp(BuildContext context, String verificationId, String userOtp) {
    authRepository.verifyOtp(
        context: context, verificationId: verificationId, userOtp: userOtp);
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepository.saveUserDataToFirebase(
        name: name, profilePic: profilePic, ref: ref, context: context);
  }
}

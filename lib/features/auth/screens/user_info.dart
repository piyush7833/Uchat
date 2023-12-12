import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ourchat/components/partials/repositories/common_firebase_storage.dart';
import 'package:ourchat/components/partials/utils.dart';
import 'package:ourchat/features/auth/controller/auth_controller.dart';
import 'package:ourchat/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserInformation extends ConsumerStatefulWidget {
  static const String routeName = '/userInfo';
  const UserInformation({super.key});

  @override
  ConsumerState<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends ConsumerState<UserInformation> {
  final TextEditingController nameController = TextEditingController();
  File? selectedImage;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    final permissionStatus = await Permission.camera.request();
    if (permissionStatus.isGranted) {
      final imagePicker = ImagePicker();
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        setState(() {});
      }
    } else {
      // Handle the case where the user denied camera access.
      // You can show a dialog or a message to inform the user.
    }
  }

  void storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .saveUserDataToFirebase(context, name, selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  selectedImage == null
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small/default-avatar-profile-icon-of-social-media-user-vector.jpg"),
                          backgroundColor: greyColor,
                          radius: 64,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(selectedImage!),
                          backgroundColor: blueColor,
                          radius: 64,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: blueColor,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(hintText: "Enter your name"),
                    ),
                  ),
                  IconButton(
                      onPressed: storeUserData, icon: const Icon(Icons.done))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

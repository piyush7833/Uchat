import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ourchat/components/partials/customButton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:ourchat/components/partials/utils.dart';
import 'package:ourchat/features/auth/controller/auth_controller.dart';

//providers are used using consumer so we need to change this whole screen in consumerConsumer

class Auth extends ConsumerStatefulWidget {
  static const routeName = '/auth';
  const Auth({super.key});

  @override
  ConsumerState<Auth> createState() => _AuthState();
}

class _AuthState extends ConsumerState<Auth> {
  @override
  final phoneNumberController = TextEditingController();
  Country? country;
  @override
  void dispose() {
    phoneNumberController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneNumberController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      print('+${country!.phoneCode}${phoneNumber}');
      ref.read(authControllerProvider).signInWithPhone(context,
          '+${country!.phoneCode}${phoneNumber}'); //widget ref  //read=> provider.of(context,listen:false)
    } else {
      showSnackBar(context: context, content: "Enter valid phone number");
    }
  }
  //widget ref makes widget interact with provider
  //provider ref interact provider with provider

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Your Phone Number"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Our Chat need to verify your phone number"),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: pickCountry,
                  child: const Text('Pick Country'),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    if (country != null) Text('+${country!.phoneCode}'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(hintText: "Phone Numer"),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: 90,
              child: CustomButton(text: "Next", onPressed: sendPhoneNumber),
            )
          ],
        ),
      ),
    );
  }
}

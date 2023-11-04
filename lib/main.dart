import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ourchat/features/landing/screens/landing_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:ourchat/responsive/responsive_layout.dart';
// import 'package:ourchat/screens/mobile_screen_layout.dart';
// import 'package:ourchat/screens/web_screen_layout.dart';
import 'package:ourchat/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ourchat/utils/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //to use asynchronus in app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
      child: MyApp())); //providerscope keeps state of the application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(color: appBarColor)),
      // home: const ResponsiveLayout(
      //     mobileScreenLayout: MobileScreenLayout(),
      //     webScreenLayout: WebScreenLayout()),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const LandingScreen(),
    );
  }
}

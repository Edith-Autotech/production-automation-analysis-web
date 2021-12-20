import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:production_automation_web/src/screens/landing_screens/landing_screen_factory.dart';

import '../authentication/sign_in_screen.dart';



class LandingScreen extends StatelessWidget {
  static const String routeName = "/landing";
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  const LandingScreen({Key? key}) : super(key: key);

  Future<String?> get jwtOrEmpty async {
    // print("Future Called");
    var jwt = await storage.read(key: "jwt");
    // print(jwt);
    if (jwt == null) return null;
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: jwtOrEmpty,
      builder: (context, snapshot) {
        print(snapshot);
        if (!snapshot.hasData) {
          return const SignInScreen();
        }
        // print("Here");
        String? token = snapshot.data;
        // print(token);
        // print(token!.length);
        return FactoryLandingScreen(token: token!);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:production_automation_web/src/screens/main/main.dart';

// import '/src/screens/landing_screens/landing_screen_factory.dart';
import '/src/screens/login/sign_in_screen.dart';

class LandingScreen extends StatelessWidget {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Widget? child;
  const LandingScreen({Key? key, this.child}) : super(key: key);

  Future<String?> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return null;
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: jwtOrEmpty,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignInScreen();
        }
        String token = snapshot.data!;

        return MainScreen(
          token: token,
          child: child,
        );
      },
    );
  }
}

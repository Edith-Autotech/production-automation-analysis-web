// import 'package:adminapp/src/screens/landing_screeen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_web_auth/flutter_web_auth.dart';
// import 'package:provider/provider.dart';

// import 'social_sign_in_button.dart';
// import '/src/provider/grapqhql_database.dart';

// class GoogleSignInButton extends StatefulWidget {
//   const GoogleSignInButton({Key? key}) : super(key: key);

//   @override
//   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// }

// class _GoogleSignInButtonState extends State<GoogleSignInButton> {
//   bool _isLoading = false;
//   String? authUrl;
//   @override
//   void initState() {
//     super.initState();
//     this.fetchUrl();
//   }

//   Future<void> fetchUrl() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     String _url = await database.getAuthUrl();
//     setState(() {
//       authUrl = _url;
//     });
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _launchURL() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final String result = await FlutterWebAuth.authenticate(
//       url: authUrl!,
//       callbackUrlScheme: "botCallbackSchema",
//     );
//     print("----------------------");
//     final String code = result.split("=")[1];
//     print(code);
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     final String? token = await database.loginWithGoogle(code);
//     final FlutterSecureStorage storage = FlutterSecureStorage();
//     await storage.write(key: "jwt", value: token!);

//     setState(() {
//       _isLoading = false;
//     });

//     Navigator.pushReplacementNamed(context, LandingPage.routeName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return !_isLoading
//         ? SocialSignInButton(
//             assetName: "assets/images/google-logo.png",
//             color: Colors.white,
//             textColor: Colors.black,
//             text: "Sign in with google",
//             onPressed: () => this._launchURL(),
//           )
//         : Center(child: CircularProgressIndicator());
//   }
// }

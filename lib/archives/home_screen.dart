// import 'package:flutter/material.dart';
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:production_automation_web/src/models/factory.dart';
// import 'package:production_automation_web/src/models/user.dart';
// import 'package:production_automation_web/src/widgets/Tab%20Body/machine_tab_body.dart';
// import 'package:production_automation_web/src/widgets/Tab%20Body/stock_tab_body.dart';
// // import 'package:production_automation_web/src/widgets/dialog_box/platform_alert_dialog.dart';
// import 'package:production_automation_web/src/widgets/label/label.dart';

// // import '../../constants.dart';
// // import 'landing_screens/landing_screen_auth.dart';

// class HomeScreen extends StatefulWidget {
//   final String token;
//   final FactoryModel factoryModel;
//   const HomeScreen({
//     Key? key,
//     required this.token,
//     required this.factoryModel,
//   }) : super(key: key);
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   // final FlutterSecureStorage _storage = const FlutterSecureStorage();
//   late TabController _controller;
//   // ! fetch late user data
//   late UserModel user;

// // * logout
//   // void _logout() async => _storage.deleteAll().then(
//   //       (value) => Navigator.pushReplacement(
//   //           context,
//   //           MaterialPageRoute(
//   //             builder: (_) => LandingScreen(),
//   //           )),
//   //     );

//   // Future<void> _confirmLogout() async {
//   //   // * awating user input from dialog box to confirm logout
//   //   final didRequestSignOut = await PlatformAlertDialog(
//   //     title: Constants.logout,
//   //     content: Constants.confirmLogout,
//   //     cancelActionText: Constants.cancel,
//   //     defaultActionText: Constants.logout,
//   //     actionHandler: () => Navigator.pop(context),
//   //   ).show(context);

//   //   if (didRequestSignOut == true) {
//   //     _logout();
//   //     Navigator.of(context).pop();
//   //   }
//   // }

//   @override
//   void initState() {
//     super.initState();
//     print(user.admin);
//     if (user.admin) {
//       _controller = TabController(length: 2, vsync: this);
//     } else {
//       _controller = TabController(length: 1, vsync: this);
//     }
//     _controller.addListener(_handleController);
//   }

//   void _handleController() => setState(() {});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.factoryModel.factoryName),
//         bottom: TabBar(
//           controller: _controller,
//           tabs: [
//             if (user.admin)
//               Tab(
//                 child: label("Machines"),
//               ),
//             Tab(
//               child: label("Stock"),
//             )
//           ],
//         ),
//         actions: [
//           TextButton(
//             child: label("Sign out"),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: TabBarView(
//         controller: _controller,
//         children: [
//           if (user.admin) MachineTabBody(factoryModel: widget.factoryModel),
//           StockTabBody(
//             user: user,
//             factoryModel: widget.factoryModel,
//           ),
//         ],
//       ),
//     );
//   }
// }

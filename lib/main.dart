import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'config/graphql_config.dart';

import 'constants/style.dart';

import 'controllers/menu_controller.dart';
import 'controllers/navigation_controller.dart';
import 'controllers/factory_controller.dart';
import 'controllers/machine_controller.dart';
import 'controllers/reason_controller.dart';
import 'controllers/settings_menu_controller.dart';
import 'controllers/user_controller.dart';
import 'controllers/count_controller.dart';
import 'controllers/part_controller.dart';
import 'views/authentication/auth_landing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserController());
  Get.put(FactoryController());
  Get.put(MachineController());
  Get.put(PartController());
  Get.put(ReasonController());
  Get.put(CountController());
  Get.put(MenuController());
  Get.put(SettingsMenuController());
  Get.put(NavigationController());
  Get.put(SettingsNavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GraphQLConfiguration _config = GraphQLConfiguration();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: _config.client,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Paa-Web",
        theme: ThemeData(
          primaryColor: active,
          canvasColor: canvasColor,
          backgroundColor: canvasColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: light,
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ).apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
        home: const AuthLanding(),
      ),
    );
  }
}

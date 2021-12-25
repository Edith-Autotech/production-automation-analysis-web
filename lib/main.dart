import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:production_automation_web/config/controllers/menu_controller.dart';
import 'package:production_automation_web/constants.dart';
// import 'package:production_automation_web/responsive.dart';
import 'package:production_automation_web/src/routes/router_generator.dart';
import 'package:production_automation_web/src/routes/routes.dart';
import 'package:production_automation_web/src/screens/landing_screens/landing_screen_auth.dart';
// import 'package:production_automation_web/src/screens/main/main.dart';
import 'package:provider/provider.dart';

import 'config/graphql_config.dart';
import 'config/grapqhql_database.dart';
// import 'src/screens/landing_screens/landing_screen_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GraphQLConfiguration _config = GraphQLConfiguration();

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: _config.client,
      child: MultiProvider(
        providers: [
          Provider<ApiDatabase>(create: (_) => GraphQLDatabase()),
          ChangeNotifierProvider<MenuController>(create: (_) => MenuController()),
        ],
        child: MaterialApp(
          title: 'PAA web',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Constants.bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
              bodyColor: Colors.white,
            ),
            canvasColor: Constants.secondaryColor,
          ),
          builder: (ctx, child) => LandingScreen(child: child),
          // initialRoute: routeAuthLanding,
          navigatorKey: navKey,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}

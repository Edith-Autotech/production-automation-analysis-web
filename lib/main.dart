import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'config/graphql_config.dart';
import 'config/grapqhql_database.dart';
import 'src/screens/landing_screens/landing_screen_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GraphQLConfiguration _config = GraphQLConfiguration();

  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: _config.client,
      child: MultiProvider(
        providers: [
          Provider<ApiDatabase>(create: (_) => GraphQLDatabase()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const LandingScreen(),
        ),
      ),
    );
  }
}

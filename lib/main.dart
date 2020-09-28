import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/providers/auth.dart';
import 'package:production_automation_web/providers/database.dart';
import 'package:production_automation_web/screens/landing_screens/landing_screen_auth.dart';
import 'package:provider/provider.dart';

// import 'screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider<Database>(create: (_) => Database(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingScreen(),
      ),
    );
  }
}

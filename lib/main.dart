import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SplashScreen.dart';
import 'model/utilities/routeGenerator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this is to remove the status bar in android
// this is to ensure the app does not go on landscape when phone is rotated
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dexter-Health',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const SplashScreen(),
    );
  }
}

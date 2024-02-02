
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainproject_crop/services/firebase_auth.dart';
import 'package:mainproject_crop/views/home.dart';
import 'package:mainproject_crop/views/login.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mainproject_crop/views/screen1.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FireAuth authController = Get.put(FireAuth());
    // authController.decideRoute();

    return MaterialApp(
      theme: ThemeData(primaryColor:  Color.fromARGB(255, 123, 0, 245)),
        home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TasksPage();
        } else {
          return LoginScreen();
          //edit
        }
      },
    ));
  }
}
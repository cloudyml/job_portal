import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/firebase_options.dart';
import 'package:job_portal_cloudyml/screens/login_hr.dart';

import 'controllers/googlecontroller.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  Get.put(GoogleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginHR(),
    );
  }
}

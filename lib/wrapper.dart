import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/routes/app_routes.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';

class AuthWrapper extends StatefulWidget {
  AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (_auth.currentUser != null) {
        if (userRole.value == "student") {
          GoRouter.of(context).pushReplacement(AppRoutes.studentHome);
        } else {
          GoRouter.of(context).pushReplacement(AppRoutes.hrDashboard);
        }
      } else {
        GoRouter.of(context).push(AppRoutes.studentHome);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

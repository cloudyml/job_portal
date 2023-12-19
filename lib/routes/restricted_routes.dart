import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class AuthMiddleware extends GetMiddleware {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  RouteSettings? redirect(String? route) {
    if (route == '/restricted' && _auth.currentUser == null) {
      // Redirect to login screen if the user is not authenticated
      return const RouteSettings(name: '/login');
    }

    // Allow other routes
    return null;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../utils/contants.dart';

class LoginController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login(context) async {
    try {
      isLoading(true);
      if (email.isNotEmpty && password.isNotEmpty) {
        saveLoginState(context);
        await auth.signInWithEmailAndPassword(
            email: email.value, password: password.value);
        GoRouter.of(context).pushReplacement(AppRoutes.studentHome);
      } else {
        Get.snackbar('Error', 'Login failed. Check your credentials.');
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Login failed. Check your credentials.');
    }
  }

  Future<void> logout(context) async {
    try {
      userRole.value = '';
      saveLoginOutState(context);
      await auth.signOut();
      GoRouter.of(context).pushReplacement(AppRoutes.initialRoute);
    } catch (e) {
      Get.snackbar('Error', 'Logout failed. $e');
    }
  }
}

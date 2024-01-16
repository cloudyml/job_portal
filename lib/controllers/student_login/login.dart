import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../utils/contants.dart';
import '../homescreen_controller/home_controller.dart';

class LoginController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isLoading = false.obs;
  final homeController = Get.put(HomeController());
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login(context) async {
    var result;
    try {
      isLoading(true);
      if (email.isNotEmpty && password.isNotEmpty) {
        saveLoginState(context);
        result = await auth.signInWithEmailAndPassword(
            email: email.value, password: password.value);
        if (result.user != null) {
          homeController.loggedIN.value = true;
          GoRouter.of(context).push(AppRoutes.studentHome);
          isLoading(false);
        }
      } else {
        showToast("Please write email and password to continue.");
        isLoading(false);
      }
      isLoading(false);
    } catch (e) {
      print("object $e");
      isLoading(false);
      showToast("Login failed. Check your credentials.");
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

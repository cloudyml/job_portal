import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/app_routes.dart';
import '../routes/login_state_check.dart';

final sizeBoxOf10 = SizedBox(height: 10.sp);
final horizontalSizeBoxOf10 = SizedBox(width: 10.sp);

final userRole = ''.obs;
const String loggedInKey = 'LoggedIn';


void saveLoginState(BuildContext context) {
  Provider.of<LoginState>(context, listen: false).loggedIn = true;
}

void saveLoginOutState(BuildContext context) {
  Provider.of<LoginState>(context, listen: false).loggedIn = false;
}

routeToDashBoards(BuildContext context,String role) {
  if (role == "student") {
    GoRouter.of(context).pushReplacement(AppRoutes.studentHome);
  } else if ((role == "HR")) {
    GoRouter.of(context).pushReplacement(AppRoutes.hrDashboard);
  }
}

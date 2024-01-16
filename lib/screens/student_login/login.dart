import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/routes/app_routes.dart';
import 'package:job_portal_cloudyml/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/student_login/login.dart';
import '../../utils/contants.dart';

class StudentLoginScreen extends StatelessWidget {
  StudentLoginScreen({super.key});

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.25),
      body: Padding(
        padding: EdgeInsets.only(
            left: 60.sp, right: 60.sp, top: 40.sp, bottom: 40.sp),
        child: Container(
          padding: EdgeInsets.only(
              left: 20.sp, right: 20.sp, top: 10.sp, bottom: 10.sp),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(companyLogo, scale: 2),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                onChanged: (value) => _loginController.email.value = value,
                style: TextStyle(color: mainColor),
                decoration: decoration.copyWith(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) => _loginController.password.value = value,
                obscureText: false,
                onSubmitted: (value) {
                  _loginController.login(context);
                },
                style: TextStyle(color: mainColor),
                decoration: decoration.copyWith(labelText: 'Password'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return ElevatedButton(
                      onPressed: () {
                        _loginController.login(context);
                      },
                      child: _loginController.isLoading.value
                          ? SizedBox(
                              height: 12.sp,
                              width: 12.sp,
                              child: CircularProgressIndicator(
                                  color: Colors.white))
                          : Text('Login'),
                    );
                  }),
                  SizedBox(width: 8.sp),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.studentSignup);
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you an HR? Sign up ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.hrSignUP);
                    },
                    child: Text(
                      "here",
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final decoration = InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: mainColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: Colors.grey)));
}

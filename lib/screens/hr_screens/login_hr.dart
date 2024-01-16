import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/googlecontroller.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/signup_hr.dart';
import 'package:job_portal_cloudyml/screens/student_login/signup.dart';
import 'package:job_portal_cloudyml/utils/colors.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/homescreen_controller/home_controller.dart';
import '../../routes/app_routes.dart';

class LoginHR extends StatefulWidget {
  const LoginHR({super.key});

  @override
  State<LoginHR> createState() => _LoginHRState();
}

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
GoogleController _googleController = Get.find();

class _LoginHRState extends State<LoginHR> {
  final homeController = Get.put(HomeController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isPhone = screenWidth < 600;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
            child: Container(
              height: isPhone
                  ? Adaptive.h(80)
                  : MediaQuery.of(context).size.height * .85,
              width: isPhone
                  ? Adaptive.w(80)
                  : MediaQuery.of(context).size.width * .50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .1,
                        vertical: MediaQuery.of(context).size.width * .01),
                    child: Image.asset(companyLogo),
                  ),
                  Center(
                    child: Text(
                      "Enter your Login Credentials",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isPhone
                              ? 15.sp
                              : MediaQuery.of(context).size.width * .02,
                          vertical: MediaQuery.of(context).size.width * .02),
                      child: TextField(
                        controller: emailcontroller,
                        style: TextStyle(color: mainColor),
                        autofocus: true,
                        decoration: InputDecoration(
                          // hintText: 'User Name',
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isPhone
                              ? 15.sp
                              : MediaQuery.of(context).size.width * .02,
                          vertical: MediaQuery.of(context).size.width * .02),
                      child: TextField(
                        controller: passwordcontroller,
                        style: TextStyle(color: mainColor),
                        onSubmitted: (value) async {
                          UserCredential? result =
                              await _googleController.signIn(
                                  emailcontroller.text,
                                  passwordcontroller.text,
                                  context);
                          if (result != null) {
                            // await homeController.getUserDetails();
                            // routeToDashBoards(context);
                            GoRouter.of(context)
                                .pushReplacement(AppRoutes.studentHome);
                          } else {
                            Fluttertoast.showToast(
                              msg:
                                  "Login failed. Check your email and password.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },
                        decoration: InputDecoration(
                          // hintText: 'Password',
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  SizedBox(
                    width: isPhone
                        ? Adaptive.w(40)
                        : MediaQuery.of(context).size.width * .40,
                    height: isPhone
                        ? Adaptive.w(10)
                        : MediaQuery.of(context).size.height * .1,
                    child: Obx(() {
                      return ElevatedButton(
                        onPressed: () async {
                          UserCredential? result =
                              await _googleController.signIn(
                                  emailcontroller.text,
                                  passwordcontroller.text,
                                  context);
                          if (result != null) {
                            // await homeController.getUserDetails();
                            _googleController.isLoading.value = false;
                            // routeToDashBoards(context);
                            GoRouter.of(context)
                                .pushReplacement(AppRoutes.studentHome);
                          } else {
                            Fluttertoast.showToast(
                              msg:
                                  "Login failed. Check your email and password.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            _googleController.isLoading.value = false;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: _googleController.isLoading.isTrue
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .05,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupHR()),
                          );
                        },
                        child: Text(
                          "HR Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StudentSignupScreen()));
                            // GoRouter.of(context).push(AppRoutes.studentSignup);
                          },
                          child: Text(
                            "Student Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

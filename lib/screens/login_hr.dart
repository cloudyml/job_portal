import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/controllers/googlecontroller.dart';
import 'package:job_portal_cloudyml/screens/signup_hr.dart';
import 'package:job_portal_cloudyml/screens/student_login/signup.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';

import '../controllers/homescreen_controller/home_controller.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
            child: Container(
              height: MediaQuery.of(context).size.height * .85,
              width: MediaQuery.of(context).size.width * .50,
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
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .1,
                        vertical: MediaQuery.of(context).size.width * .01),
                    child: Image.asset("assets/images/cloudyml_logobg.png"),
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
                          horizontal: MediaQuery.of(context).size.width * .02,
                          vertical: MediaQuery.of(context).size.width * .02),
                      child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: 'User Name',
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
                          horizontal: MediaQuery.of(context).size.width * .02,
                          vertical: MediaQuery.of(context).size.width * .02),
                      child: TextField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .40,
                    height: MediaQuery.of(context).size.height * .1,
                    child: ElevatedButton(
                      onPressed: () async {
                        UserCredential? result = await _googleController.signIn(
                            emailcontroller.text,
                            passwordcontroller.text,
                            context);
                        if (result != null) {
                          await homeController.getUserDetails();
                          routeToDashBoards(context);
                        } else {
                          Fluttertoast.showToast(
                            msg: "Login failed. Check your email and password.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
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

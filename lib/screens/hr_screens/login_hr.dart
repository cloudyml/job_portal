import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/googlecontroller.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/signup_hr.dart';
import 'package:job_portal_cloudyml/screens/student_login/signup.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';

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
                    offset: const Offset(2, 3),
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
                  const Center(
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
                        style: TextStyle(color: Colors.black), 
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          
                          hintText: 'Email address',
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
                        style: TextStyle(color: Colors.black), 
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
                          String role = "";
                          await FirebaseFirestore.instance
                              .collection("Users_jobportal")
                              .doc(result.user!.uid)
                              .get()
                              .then((value) {
                            role = value.data()!["role"];
                          });
                          print(result.user!.email);
                          await homeController.gethrUserDetails();

                          // ignore: use_build_context_synchronously
                          routeToDashBoards(context, role);
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
                      child: const Text(
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
                          GoRouter.of(context).push(AppRoutes.hrSignUP);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const SignupHR()),
                          // );
                        },
                        child: const Text(
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
                          child: const Text(
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

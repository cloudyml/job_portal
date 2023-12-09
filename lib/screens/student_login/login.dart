import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/screens/student_login/signup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/student_login/login.dart';

class StudentLoginScreen extends StatelessWidget {
  StudentLoginScreen({super.key});

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Login'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey.withOpacity(0.25),
      body: Padding(
        padding: EdgeInsets.only(
            left: 60.sp, right: 60.sp, top: 30.sp, bottom: 30.sp),
        child: Container(
          padding: EdgeInsets.only(
              left: 20.sp, right: 20.sp, top: 10.sp, bottom: 10.sp),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) => _loginController.email.value = value,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) => _loginController.password.value = value,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _loginController.login(context);
                    },
                    child: _loginController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('Sign up'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentSignupScreen()));
                    },
                    child: _loginController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('Sign Up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

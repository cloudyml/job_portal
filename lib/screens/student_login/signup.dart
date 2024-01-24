import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/student_login/signup.dart';
import '../../utils/colors.dart';

class StudentSignupScreen extends StatelessWidget {
  final SignupController _signupController = Get.put(SignupController());

  StudentSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Colors.grey.withOpacity(0.25),
      body: Padding(
        padding: EdgeInsets.only(
            left: 60.sp, right: 60.sp, top: 10.sp, bottom: 10.sp),
        child: Container(
          padding: EdgeInsets.only(
              left: 20.sp, right: 20.sp, top: 10.sp, bottom: 10.sp),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.firstName.value = value,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.lastName.value = value,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) => _signupController.email.value = value,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.mobileNumber.value = value,
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.occupation.value = value,
                  decoration: InputDecoration(labelText: 'Domain'),
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.linkedIn.value = value,
                  decoration: InputDecoration(labelText: 'LinkedIn'),
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.currentSalary.value = value,
                  decoration: InputDecoration(labelText: 'Current Salary'),
                ),
                Row(
                  children: [
                    Text('Experienced:'),
                    Obx(() {
                      return Switch(
                        value: _signupController.isExperienced.value,
                        onChanged: (value) =>
                            _signupController.isExperienced.value = value,
                      );
                    }),
                  ],
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.password.value = value,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                TextField(
                   style: TextStyle(color: mainColor),
                  onChanged: (value) =>
                      _signupController.confirmPassword.value = value,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _signupController.selectResume,
                      child: Text('Select Resume'),
                    ),
                    SizedBox(width: 8),
                    Obx(() {
                      final selectedResume = _signupController.resumeName.value;
                      return selectedResume != ''
                          ? Text('${selectedResume}')
                          : SizedBox.shrink();
                    }),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_signupController.email.isEmpty ||
                          _signupController.password.isEmpty) {
                        Fluttertoast.showToast(msg: "Passwords do not match");
                      } else {
                        await _signupController.signup(context);
                      }
                    },
                    child: _signupController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('Sign Up'),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

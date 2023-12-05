import 'package:flutter/material.dart';
import 'package:job_portal_cloudyml/screens/dashboard.dart';
import 'package:job_portal_cloudyml/screens/signup_hr.dart';

class LoginHR extends StatefulWidget {
  const LoginHR({super.key});
  @override
  State<LoginHR> createState() => _LoginHRState();
}

class _LoginHRState extends State<LoginHR> {
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashBoard()),
                        );
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
                          "Don't have an account? Click here to create one",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
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

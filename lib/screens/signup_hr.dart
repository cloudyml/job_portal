import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/screens/login_hr.dart';

import '../controllers/googlecontroller.dart';

class SignupHR extends StatefulWidget {
  const SignupHR({super.key});

  @override
  State<SignupHR> createState() => _SignupHRState();
}

TextEditingController fnamecontroller = TextEditingController();
TextEditingController lnamecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController cpasswordcontroller = TextEditingController();
TextEditingController orgnamecontroller = TextEditingController();
TextEditingController linkedincontroller = TextEditingController();
TextEditingController estcontroller = TextEditingController();
String? businesstype;

class _SignupHRState extends State<SignupHR> {
  var selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Row(
        children: [
          Container(
            color: Color.fromARGB(255, 225, 225, 225),
            width: MediaQuery.of(context).size.width * .20,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .01,
                      top: MediaQuery.of(context).size.height * .005,
                      bottom: MediaQuery.of(context).size.height * .05),
                  child: Image.asset("assets/images/cloudyml_logobg.png"),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .02),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginHR()),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Image.asset("assets/images/image_logo.png"),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Center(
                            child: Text(
                              "Go Back",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .80,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .02,
                          top: MediaQuery.of(context).size.height * .04,
                          bottom: MediaQuery.of(context).size.height * .04),
                      child: const Row(
                        children: [
                          Text('Register with us to hire the best',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .02,
                        right: MediaQuery.of(context).size.width * .02),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Enter your first name:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(height: 8.0),
                              // Add some space between the heading and text field
                              TextField(
                                controller: fnamecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Type here...',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Enter your last name:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(height: 8.0),
                              // Add some space between the heading and text field
                              TextField(
                                controller: lnamecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Type here...',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .02,
                        right: MediaQuery.of(context).size.width * .02,
                        top: MediaQuery.of(context).size.height * .04,
                        bottom: MediaQuery.of(context).size.height * .04),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name of organization:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                          SizedBox(height: 8.0),
                          // Add some space between the heading and text field
                          TextField(
                            controller: orgnamecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Type here...',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .02,
                        right: MediaQuery.of(context).size.width * .02,
                        //top: MediaQuery.of(context).size.height * .04,
                        bottom: MediaQuery.of(context).size.height * .04),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Organizational email:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                          SizedBox(height: 8.0),
                          // Add some space between the heading and text field
                          TextField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Type here...',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .02,
                        right: MediaQuery.of(context).size.width * .04,
                        top: MediaQuery.of(context).size.height * .04,
                        bottom: MediaQuery.of(context).size.height * .04),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select an option:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            // Add some space between the title and dropdown
                            DropdownButton<String?>(
                              hint: Text('Select the business type'),
                              value: businesstype,
                              onChanged: (String? newValue) {
                                setState(() {
                                  businesstype = newValue.toString();
                                });
                              },
                              items: <String?>[
                                'Small Sized Business',
                                'Medium Sized Business',
                                'Large Sized Business',
                              ].map<DropdownMenuItem<String?>>((String? value) {
                                return DropdownMenuItem<String?>(
                                  value: value,
                                  child: Text(value ?? " "),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Establishment of company:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(height: 8.0),
                              // Add some space between the heading and text field
                              TextField(
                                controller: estcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Type here...',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .02,
                        right: MediaQuery.of(context).size.width * .02,
                        top: MediaQuery.of(context).size.height * .04,
                        bottom: MediaQuery.of(context).size.height * .04),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Enter your Password:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(height: 8.0),
                              // Add some space between the heading and text field
                              TextField(
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Type here...',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Reconfirm your Password:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(height: 8.0),
                              // Add some space between the heading and text field
                              TextField(
                                controller: cpasswordcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Type here...',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .02,
                        right: MediaQuery.of(context).size.width * .02,
                        //top: MediaQuery.of(context).size.height * .04,
                        bottom: MediaQuery.of(context).size.height * .04),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Your linkedin id(For confirmation purpose):',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                          SizedBox(height: 8.0),
                          // Add some space between the heading and text field
                          TextField(
                            controller: linkedincontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Type here...',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * .2,
                          height: MediaQuery.of(context).size.width * .04,
                          child: MyButton()))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isHovered = false;
  GoogleController _googleController = Get.find();
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                // Button is pressed
                return Colors.green;
              } else if (isHovered) {
                // Button is hovered
                return Colors.redAccent;
              }
              // Button default color
              return Colors.red;
            },
          ),
        ),
        onPressed: () async {
          UserCredential? user = await _googleController.signUp(
              emailcontroller.text, passwordcontroller.text);
          print(user!.user!.uid);
          _googleController.saveUserDetails(
              user.user!.uid,
              fnamecontroller.text,
              lnamecontroller.text,
              orgnamecontroller.text,
              emailcontroller.text,
              businesstype!,
              estcontroller.text,
              linkedincontroller.text);
          homeController.getUserDetails();
        },
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

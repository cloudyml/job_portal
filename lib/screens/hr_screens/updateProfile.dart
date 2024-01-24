import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/login_hr.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '../../controllers/businesscontroller.dart';
import '../../controllers/googlecontroller.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../model/businessmodel.dart';
import '../../provider/businessprovider.dart';
import '../../routes/app_routes.dart';
import 'contactuspage/contactuspage_widget.dart';
import 'data_page/data_page_widget.dart';
import 'home_page/home_page_widget.dart';

class updateProfile extends StatefulWidget {
  const updateProfile({super.key});

  @override
  State<updateProfile> createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {
  // ignore: prefer_typing_uninitialized_variables
  var selectedOption;
  @override
  void initState() {
    super.initState();
    // Call getBusinessData when the screen is initialized
    _getBusinessData();
  }

  TextEditingController fnamecontroller=TextEditingController();
  TextEditingController lnamecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController orgnamecontroller=TextEditingController();
  TextEditingController linkedincontroller=TextEditingController();
  TextEditingController estcontroller=TextEditingController();
  String businesstype="";
  BusinessModel? businessData1;
  Future<BusinessModel?> _getBusinessData() async {
    try {
      final CollectionReference businessCollection =
          FirebaseFirestore.instance.collection('Users_jobportal');

      final DocumentSnapshot<Object?> snapshot = await businessCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      final businessData = BusinessModel(
        businessType: snapshot['business type'],
        establishmentDate: snapshot['company establishment date'],
        description: snapshot['description'],
        firstName: snapshot['firstname'],
        lastName: snapshot['lastname'],
        linkedinId: snapshot['linkedin id'],
        organizationName: snapshot['organization name'],
        organizationalEmail: snapshot['organizational email'],
        role: snapshot['role'],
      );

      businessData1 = businessData;
      fnamecontroller.text = businessData.firstName ?? '';
lnamecontroller.text = businessData.lastName ?? '';
emailcontroller.text = businessData.organizationalEmail ?? '';
orgnamecontroller.text = businessData.organizationName ?? '';
linkedincontroller.text = businessData!.linkedinId ?? '';
estcontroller.text = businessData!.establishmentDate.toString(); // Assuming establishmentOfCompany is of String type
businesstype = businessData!.businessType ?? '';
       
      print('Business data retrieved from Firestore: $businessData');
    } catch (e) {
      print('Error retrieving business data: $e');
    }
    return businessData1;
    //await FirestoreService().getBusinessData(context);
  }

  GoogleController _googleController = Get.find();
  final homeController = Get.put(HomeController());
  // final businessData = Provider.of<BusinessProvider>(context).businessData;

  bool isHovered = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
//      fnamecontroller.text=businessData!.firstName;
//  lnamecontroller.text = businessData.lastName;
//  emailcontroller.text = businessData.organizationalEmail;
//  orgnamecontroller.text = businessData.organizationName;
//  linkedincontroller.text = businessData.linkedinId;
//  estcontroller.text = businessData.establishmentDate;
//  businesstype=businessData.businessType;
    return FutureBuilder<void>(
          future:
              _getBusinessData(), // Replace with the actual Future you want to execute
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
        //  backgroundColor: Colors.black,
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: WebViewAware(
            child: Drawer(
          elevation: 16.0,
          child: SingleChildScrollView(
            child: Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(
              //         'assets/images/backgroungimg.png'), // Replace with your image path
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.hrupdateprofile);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const updateProfile()),
                      // );
                    },
                    child: Container(
                      width: 320.0,
                      height: 100.0,

                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage(
                      //         'assets/images/backgroungimg.png'), // Replace with your image path
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      // decoration: BoxDecoration(
                      //   color: FlutterFlowTheme.of(context)
                      //       .primaryBackground,
                      // ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (scaffoldKey.currentState!.isDrawerOpen ||
                                  scaffoldKey.currentState!.isEndDrawerOpen) {
                                Navigator.pop(context);
                              }
                            },
                            child: Icon(
                              Icons.arrow_back_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: ClipOval(
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 5.0,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Image.network(
                                    'https://picsum.photos/seed/584/600',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '${businessData1!.firstName} ${businessData1!.lastName}',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: 318.0,
                      height: 866.0,
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage(
                      //         'assets/images/backgroungimg.png'), // Replace with your image path
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).push(AppRoutes.hrhomepage);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageWidget()),
                          );
                        },
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 40.0,
                                    ),
                                    Text(
                                      'Home',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    GoRouter.of(context)
                                        .push(AppRoutes.hrJobPosting);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const DataPageWidget()),
                                    // );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.badge_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 40.0,
                                      ),
                                      Text(
                                        'Jobs created',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //                 Card(
                            //                   clipBehavior: Clip.antiAliasWithSaveLayer,
                            //                   color: FlutterFlowTheme.of(context)
                            //                       .secondaryBackground,
                            //                   elevation: 4.0,
                            //                   shape: RoundedRectangleBorder(
                            //                     borderRadius: BorderRadius.circular(24.0),
                            //                   ),
                            //                   child: Container(
                            //                     width: 100.0,
                            //                     height: 100.0,
                            //                     decoration: BoxDecoration(
                            //                       color: FlutterFlowTheme.of(context)
                            //                           .secondaryBackground,
                            //                     ),
                            //                     child: InkWell(
                            //                       splashColor: Colors.transparent,
                            //                       focusColor: Colors.transparent,
                            //                       hoverColor: Colors.transparent,
                            //                       highlightColor: Colors.transparent,
                            //                       onTap: () async {
                            //                                     Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const JobRecommendationWidget()),
                            // );

                            //                       },
                            //                       child: Row(
                            //                         mainAxisSize: MainAxisSize.max,
                            //                         mainAxisAlignment:
                            //                             MainAxisAlignment.spaceEvenly,
                            //                         children: [
                            //                           Icon(
                            //                             Icons.recommend_outlined,
                            //                             color: FlutterFlowTheme.of(context)
                            //                                 .secondaryText,
                            //                             size: 40.0,
                            //                           ),
                            //                           Text(
                            //                             'Recommendation',
                            //                             style: FlutterFlowTheme.of(context)
                            //                                 .bodyMedium
                            //                                 .override(
                            //                                   fontFamily: 'Readex Pro',
                            //                                   fontWeight: FontWeight.bold,
                            //                                 ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    GoRouter.of(context)
                                        .pushReplacement(AppRoutes.hrcontactus);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           ContactuspageWidget()),
                                    // );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.connect_without_contact,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 40.0,
                                      ),
                                      Text(
                                        'Contact us',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                icon: Icon(
                  Icons.menu_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            title: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Text(
                'Update Your Profile',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Dhurjati',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 30.0,
                    ),
              ),
            ),
            actions: [],
            centerTitle: true,
            toolbarHeight: 30.0,
            elevation: 2.0,
          ),
        ),
        body:  Container(
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(
                //         'assets/images/backgroungimg.png'), // Replace with your image path
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .80,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .02,
                                right: MediaQuery.of(context).size.width * .02),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Enter your first name:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      // Add some space between the heading and text field
                                      TextField(
                                        controller: fnamecontroller,
                                        style: TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(),
                                          hintText: 'Type here...',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Enter your last name:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      // Add some space between the heading and text field
                                      TextField(
                                        controller: lnamecontroller,
                                        style: TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          fillColor: Colors.black,
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
                                bottom:
                                    MediaQuery.of(context).size.height * .04),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Name of organization:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  // Add some space between the heading and text field
                                  TextField(
                                    controller: orgnamecontroller,
                                    style: TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.black,
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
                                bottom:
                                    MediaQuery.of(context).size.height * .04),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Organizational email:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  // Add some space between the heading and text field
                                  TextField(
                                    controller: emailcontroller,
                                    style: TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.black,
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
                                bottom:
                                    MediaQuery.of(context).size.height * .04),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Select an option:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    // Add some space between the title and dropdown
                                    Container(
                                      color: Colors.white,
                                      child: DropdownButton<String?>(
                                        hint: const Text(
                                            'Select the business type',
                                            style: TextStyle(
                                              color: Colors.black,
                                            )),
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
                                        ].map<DropdownMenuItem<String?>>(
                                            (String? value) {
                                          return DropdownMenuItem<String?>(
                                            value: value,
                                            child: Text(value ?? " ",
                                                selectionColor: Colors.black),
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Establishment of company:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      // Add some space between the heading and text field
                                      TextField(
                                        controller: estcontroller,
                                        style: TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          fillColor: Colors.black,
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
                                bottom:
                                    MediaQuery.of(context).size.height * .04),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Your linkedin id(For confirmation purpose):',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  // Add some space between the heading and text field
                                  TextField(
                                    controller: linkedincontroller,
                                    style: TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.black,
                                      border: OutlineInputBorder(),
                                      hintText: 'Type here...',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .2,
                                  height:
                                      MediaQuery.of(context).size.width * .04,
                                
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.teal),
                                      ),
                                      onPressed: () async {
                                        _googleController.updateUserDetails(
                                            FirebaseAuth
                                                .instance.currentUser!.uid,
                                            fnamecontroller!.text,
                                            lnamecontroller!.text,
                                            orgnamecontroller!.text,
                                            emailcontroller!.text,
                                            businesstype!,
                                            estcontroller!.text,
                                            linkedincontroller!.text);
                                        homeController.getUserDetails();
                                      },
                                      child: const Text(
                                        'Update Profile',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
           ); } else {
              // Show a loading indicator or other UI while waiting for the Future to complete
              return CircularProgressIndicator();
            }
          },
        );
  }
}

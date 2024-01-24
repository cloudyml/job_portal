import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/home_page/home_page_widget.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/drawer.dart';
import '../data_page/data_page_widget.dart';
import '../job_recommendation/job_recommendation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'contactuspage_model.dart';
export 'contactuspage_model.dart';

class ContactuspageWidget extends StatefulWidget {
  const ContactuspageWidget({Key? key}) : super(key: key);

  @override
  _ContactuspageWidgetState createState() => _ContactuspageWidgetState();
}

class _ContactuspageWidgetState extends State<ContactuspageWidget> {
  late ContactuspageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactuspageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> addHrQuery({
    required String hrName,
    required String hrId,
    required String hrEmailAddress,
    required String hrPhoneNumber,
    required String hrQuery,
    required BuildContext context
  }) async {
    try {
      CollectionReference hrQueriesCollection =
          FirebaseFirestore.instance.collection('hr_queries');
      await hrQueriesCollection.add({
        'hrname': hrName,
        'hrid': hrId,
        'hremailaddress': hrEmailAddress,
        'hrphonenumber': hrPhoneNumber,
        'hrquery': hrQuery,
        'status': 'pending',
      });
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your query submitted successfully. You will hear back from us very soon.'),
      ),
    );
      print('Hr Query added successfully');
    } catch (e) {
      print('Error adding Hr Query: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        drawer:WebViewAware(
            child: Drawer(
          elevation: 16.0,
          child: DrawerWidget(scaffoldKey: scaffoldKey,)
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
                buttonSize: 48.0,
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
                'Contactus',
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
        body: SingleChildScrollView(
          // top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 1444.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlipCard(
                    fill: Fill.fillBack,
                    direction: FlipDirection.HORIZONTAL,
                    speed: 400,
                    front: Container(
                      width: 1016.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Please Allow us to help you',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 30.0,
                                ),
                          ),
                          Icon(
                            Icons.handshake_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 40.0,
                          ),
                        ],
                      ),
                    ),
                    back: Container(
                      width: 1016.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Contact E-mail address',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '       team@cloudyml.com',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22.0,
                                      ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              // RichText(
                              //   textScaleFactor:
                              //       MediaQuery.of(context).textScaleFactor,
                              //   text: TextSpan(
                              //     children: [
                              //       TextSpan(
                              //         text: 'Contact E-mail address',
                              //         style: FlutterFlowTheme.of(context)
                              //             .bodyMedium
                              //             .override(
                              //               fontFamily: 'Readex Pro',
                              //               color: FlutterFlowTheme.of(context)
                              //                   .primaryBackground,
                              //               fontSize: 30.0,
                              //               fontWeight: FontWeight.bold,
                              //             ),
                              //       ),
                              //       TextSpan(
                              //         text: '       Shashank@hr.com',
                              //         style: TextStyle(
                              //           color: FlutterFlowTheme.of(context)
                              //               .primaryBackground,
                              //           fontWeight: FontWeight.w600,
                              //           fontSize: 22.0,
                              //         ),
                              //       )
                              //     ],
                              //     style:
                              //         FlutterFlowTheme.of(context).bodyMedium,
                              //   ),
                              // ),
                              // RichText(
                              //   textScaleFactor:
                              //       MediaQuery.of(context).textScaleFactor,
                              //   text: TextSpan(
                              //     children: [
                              //       TextSpan(
                              //         text: 'Contact E-mail address',
                              //         style: FlutterFlowTheme.of(context)
                              //             .bodyMedium
                              //             .override(
                              //               fontFamily: 'Readex Pro',
                              //               color: FlutterFlowTheme.of(context)
                              //                   .primaryBackground,
                              //               fontSize: 30.0,
                              //               fontWeight: FontWeight.bold,
                              //             ),
                              //       ),
                              //       TextSpan(
                              //         text: '       Shashank@hr.com',
                              //         style: TextStyle(
                              //           color: FlutterFlowTheme.of(context)
                              //               .primaryBackground,
                              //           fontWeight: FontWeight.w600,
                              //           fontSize: 22.0,
                              //         ),
                              //       )
                              //     ],
                              //     style:
                              //         FlutterFlowTheme.of(context).bodyMedium,
                              //   ),
                              // ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Scan this barcode to contact us on our email',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                           
                            width: 100.0,
                            height: 90.0,
                           child:Image.asset('assets/images/qrmail.png')
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode1,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Please Enter Your Name',
                    labelStyle:
                        FlutterFlowTheme.of(context).headlineMedium.override(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                            ),
                    alignLabelWithHint: true,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.textController1Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: TextFormField(
                  controller: _model.textController2,
                  focusNode: _model.textFieldFocusNode2,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Please Enter Your Email Address',
                    labelStyle:
                        FlutterFlowTheme.of(context).headlineMedium.override(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                            ),
                    alignLabelWithHint: true,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.textController2Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: TextFormField(
                  controller: _model.textController3,
                  focusNode: _model.textFieldFocusNode3,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Please Enter Your Phone number(optional)',
                    labelStyle:
                        FlutterFlowTheme.of(context).headlineMedium.override(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                            ),
                    alignLabelWithHint: true,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.textController3Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: TextFormField(
                  controller: _model.textController4,
                  focusNode: _model.textFieldFocusNode4,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Please Enter Your Query',
                    labelStyle:
                        FlutterFlowTheme.of(context).headlineMedium.override(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                            ),
                    alignLabelWithHint: true,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.textController4Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    addHrQuery(
                      hrName: _model.textController1!.text,
                      hrId: FirebaseAuth.instance.currentUser!.uid,
                      hrEmailAddress: _model.textController2!.text,
                      hrPhoneNumber: _model.textController3!.text,
                      hrQuery: _model.textController4!.text,
                      context: context
                    );
                    _model.textController1!.clear();
                     _model.textController2!.clear();
                      _model.textController3!.clear();
                       _model.textController4!.clear();
                  },
                  text: 'Press to submit Query',
                  options: FFButtonOptions(
                    height: 76.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

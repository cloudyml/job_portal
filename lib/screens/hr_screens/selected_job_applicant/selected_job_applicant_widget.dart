import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/applicant_screen/applicant_screen_widget.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/contactuspage/contactuspage_widget.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/data_page/data_page_widget.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/home_page/home_page_widget.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/job_recommendation/job_recommendation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rp;
import '../../../model/applicantmodel.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/drawer.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'selected_job_applicant_model.dart';
export 'selected_job_applicant_model.dart';

class SelectedJobApplicantWidget extends StatefulWidget {
  final String jobid;
  const SelectedJobApplicantWidget({Key? key, required this.jobid})
      : super(key: key);

  @override
  _SelectedJobApplicantWidgetState createState() =>
      _SelectedJobApplicantWidgetState();
}

class _SelectedJobApplicantWidgetState
    extends State<SelectedJobApplicantWidget> {
  late SelectedJobApplicantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedJobApplicantModel());
  }

  Future<List<ApplicantModel>> fetchData(String jobId) async {
    DocumentSnapshot jobDataDoc = await FirebaseFirestore.instance
        .collection('jobsData_jobportal')
        .doc(jobId)
        .get();
    List<ApplicantModel> applicantdata = [];
    List<String> applicantIds = [];
    List<dynamic> jobApplicants = jobDataDoc['job_applications'];

    for (var applicant in jobApplicants) {
      String id = applicant['student_id'];
      applicantIds.add(id);
    }
    List<DocumentSnapshot> userDocs = await FirebaseFirestore.instance
        .collection('Users_jobportal')
        .where(FieldPath.documentId, whereIn: applicantIds)
        .get()
        .then((value) => value.docs);
    for (var userDoc in userDocs) {
      applicantdata.add(ApplicantModel(
          applicantname: userDoc["name"],
          resumelink: userDoc["resumeUrl"],
          yearsofexperience: userDoc["years_of_experience"],
          currentsalary: userDoc["currentSalary"],
          domain: userDoc["domain"],
          profilepicture: userDoc["profile_picture"],
          location: userDoc["residence"],
          currentcompany: userDoc["currentCompany"],
          profilesummary: userDoc["resume_headline"],
          skills: userDoc["list_of_skills"]));
      // Add more fields as needed
    }
    return applicantdata;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: WebViewAware(
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
                'Job Applicant Page',
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
        body: SafeArea(
          top: true,
          child: FutureBuilder(
              future: fetchData(
                  widget.jobid), // Replace with your data fetching function
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Loading indicator
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<ApplicantModel>? data = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      rp.Device.screenType!= rp.ScreenType.mobile?Container(
                        width: 1965.0,
                        //height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 339.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Number of applicants applied:-',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "${data!.length}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30.0,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 444.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Number of candiadtes hired/number of posts',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '1/6',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30.0,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 467.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Number of candiadtes viewed:-',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '3',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )):Container( width: 1965.0,
                        //height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),child:Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 339.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Number of applicants applied:-',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "${data!.length}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30.0,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 444.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Number of candiadtes hired/number of posts',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '1/6',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30.0,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 467.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Number of candiadtes viewed:-',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '3',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      data.length < 1
          ? Center(
              child: Text("Currently no applicants available"),
            ):
                      rp.Device.screenType!= rp.ScreenType.mobile?Container(
                        child: Expanded(
                          child: GridView.builder(
                           // padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return buildCard(data[index]);
                            },
                          ),
                        ),
                      ):Container(
                        child: Expanded(
                          child:    ListView.builder(
                            //padding: EdgeInsets.zero,
                          
                          physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return buildCard(data![index]);
                            },
                          ),
                        ),
                      )
                    ],
                  );
                  
              
                }
              }),
        ),
      ),
    );
  }

  Widget buildCard(ApplicantModel document) {
    // Replace the code within this function with your card structure
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          context.go(AppRoutes.hrjobcandidateview, extra: document);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ApplicantScreenWidget(
          //               applicant: document,
          //             )));
        },
        child: Container(
          width: 100.0,
        //  height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.network(
                  document.profilepicture!,
                  width: 300.0,
                 height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Container(
                  width: 406.0,
                //  height: 200.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Name',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            document.applicantname!,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Current Company',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            document.currentcompany!,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Current Salary',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            document.currentsalary!,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Current Location',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            document.location!,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ],
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

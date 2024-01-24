import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rp;
import 'package:webviewx_plus/webviewx_plus.dart';

import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '../../../model/jobmodel.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/drawer.dart';
import 'data_page_model.dart';

export 'data_page_model.dart';

class DataPageWidget extends StatefulWidget {
  const DataPageWidget({Key? key}) : super(key: key);

  @override
  _DataPageWidgetState createState() => _DataPageWidgetState();
}

class _DataPageWidgetState extends State<DataPageWidget> {
  late DataPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<List<JobPost>> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection(
            'jobsData_jobportal') // Replace with your actual collection name
        .where('hr_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (querySnapshot.isNull) {
      List<JobPost> jobPosts = [];
      return jobPosts;
    } else {
      List<JobPost> jobPosts = querySnapshot.docs.map((doc) {
        return JobPost.fromMap(
            doc.data()['job_information'][0] as Map<String, dynamic>);
      }).toList();
      print(jobPosts.length);
      return jobPosts;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: WebViewAware(
            child: Drawer(
                elevation: 16.0,
                child: DrawerWidget(
                  scaffoldKey: scaffoldKey,
                ))),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
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
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Text(
                'Jobs Posted',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Dhurjati',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 30.0,
                    ),
              ),
            ),
            actions: const [],
            centerTitle: true,
            toolbarHeight: 30.0,
            elevation: 2.0,
          ),
        ),
        body: SingleChildScrollView(
          //top: true,
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
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: rp.Device.screenType != rp.ScreenType.mobile
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                GoRouter.of(context).push(AppRoutes.hrJobPost);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => JobPostingView()));
                              },
                              text: 'Post a New Job',
                              icon: const Icon(
                                Icons.work,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 56.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FlipCard(
                              fill: Fill.fillBack,
                              direction: FlipDirection.HORIZONTAL,
                              speed: 400,
                              front: Container(
                                width: 725.0,
                                height: 237.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: SizedBox(
                                  width: 370.0,
                                  height: 272.0,
                                  child: Stack(
                                    children: [
                                      FlutterFlowBarChart(
                                        barData: [
                                          FFBarChartData(
                                            yData: [2, 4, 8, 1],
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          )
                                        ],
                                        xLabels: const [
                                          "jobs posted",
                                          "jobs seen",
                                          "jobs done",
                                          "jobs not posted"
                                        ],
                                        barWidth: 16.0,
                                        barBorderRadius:
                                            BorderRadius.circular(8.0),
                                        groupSpace: 8.0,
                                        alignment:
                                            BarChartAlignment.spaceAround,
                                        chartStylingInfo: ChartStylingInfo(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          showBorder: false,
                                        ),
                                        axisBounds: const AxisBounds(),
                                        xAxisLabelInfo: const AxisLabelInfo(),
                                        yAxisLabelInfo: const AxisLabelInfo(),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -1.0, -1.0),
                                        child: FlutterFlowChartLegendWidget(
                                          entries: [
                                            LegendEntry(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                'job posted'),
                                          ],
                                          width: 100.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                          borderWidth: 1.0,
                                          borderColor: Colors.black,
                                          indicatorSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              back: Container(
                                width: 725.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                            // FFButtonWidget(
                            //   onPressed: () async {
                            //     GoRouter.of(context)
                            //         .push(AppRoutes.hrApplicantSearch);
                            //     // Navigator.push(
                            //     //     context,
                            //     //     MaterialPageRoute(
                            //     //         builder: (context) => SearchPageWidget()));
                            //   },
                            //   text: 'Search An Applicant',
                            //   icon: Icon(
                            //     Icons.search,
                            //     size: 15.0,
                            //   ),
                            //   options: FFButtonOptions(
                            //     height: 63.0,
                            //     padding: EdgeInsetsDirectional.fromSTEB(
                            //         24.0, 0.0, 24.0, 0.0),
                            //     iconPadding: EdgeInsetsDirectional.fromSTEB(
                            //         0.0, 0.0, 0.0, 0.0),
                            //     color: FlutterFlowTheme.of(context).secondary,
                            //     textStyle:
                            //         FlutterFlowTheme.of(context).titleSmall.override(
                            //               fontFamily: 'Readex Pro',
                            //               color: Colors.white,
                            //             ),
                            //     elevation: 3.0,
                            //     borderSide: BorderSide(
                            //       color: Colors.transparent,
                            //       width: 1.0,
                            //     ),
                            //     borderRadius: BorderRadius.circular(8.0),
                            //   ),
                            // ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                GoRouter.of(context).push(AppRoutes.hrJobPost);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => JobPostingView()));
                              },
                              text: 'Post a New Job',
                              icon: const Icon(
                                Icons.work,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 56.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            const SizedBox(height: 4),
                            FlipCard(
                              fill: Fill.fillBack,
                              direction: FlipDirection.HORIZONTAL,
                              speed: 400,
                              front: Container(
                                width: 725.0,
                                height: 237.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: SizedBox(
                                  width: 370.0,
                                  height: 272.0,
                                  child: Stack(
                                    children: [
                                      FlutterFlowBarChart(
                                        barData: [
                                          FFBarChartData(
                                            yData: [2, 4, 8, 1],
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          )
                                        ],
                                        xLabels: const [
                                          "jobs posted",
                                          "jobs seen",
                                          "jobs done",
                                          "jobs not posted"
                                        ],
                                        barWidth: 16.0,
                                        barBorderRadius:
                                            BorderRadius.circular(8.0),
                                        groupSpace: 8.0,
                                        alignment:
                                            BarChartAlignment.spaceAround,
                                        chartStylingInfo: ChartStylingInfo(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          showBorder: false,
                                        ),
                                        axisBounds: const AxisBounds(),
                                        xAxisLabelInfo: const AxisLabelInfo(),
                                        yAxisLabelInfo: const AxisLabelInfo(),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -1.0, -1.0),
                                        child: FlutterFlowChartLegendWidget(
                                          entries: [
                                            LegendEntry(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                'Legend 1'),
                                          ],
                                          width: 100.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                          borderWidth: 1.0,
                                          borderColor: Colors.black,
                                          indicatorSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              back: Container(
                                width: 725.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            // FFButtonWidget(
                            //   onPressed: () async {
                            //     GoRouter.of(context)
                            //         .push(AppRoutes.hrApplicantSearch);
                            //     // Navigator.push(
                            //     //     context,
                            //     //     MaterialPageRoute(
                            //     //         builder: (context) => SearchPageWidget()));
                            //   },
                            //   text: 'Search An Applicant',
                            //   icon: Icon(
                            //     Icons.search,
                            //     size: 15.0,
                            //   ),
                            //   options: FFButtonOptions(
                            //     height: 63.0,
                            //     padding: EdgeInsetsDirectional.fromSTEB(
                            //         24.0, 0.0, 24.0, 0.0),
                            //     iconPadding: EdgeInsetsDirectional.fromSTEB(
                            //         0.0, 0.0, 0.0, 0.0),
                            //     color: FlutterFlowTheme.of(context).secondary,
                            //     textStyle:
                            //         FlutterFlowTheme.of(context).titleSmall.override(
                            //               fontFamily: 'Readex Pro',
                            //               color: Colors.white,
                            //             ),
                            //     elevation: 3.0,
                            //     borderSide: BorderSide(
                            //       color: Colors.transparent,
                            //       width: 1.0,
                            //     ),
                            //     borderRadius: BorderRadius.circular(8.0),
                            //   ),
                            // ),
                          ],
                        ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 70.0, 0.0, 30.0),
                    child: Text(
                      'Previously Posted jobs',
                      style: FlutterFlowTheme.of(context).headlineLarge,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return rp.Device.screenType != rp.ScreenType.mobile
                          ? YourGridViewWithData(
                              jobData: snapshot.data,
                              context: context,
                            )
                          : YourListViewWithData(
                              jobData: snapshot.data,
                              context: context,
                            );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YourGridViewWithData extends StatelessWidget {
  final List<JobPost>? jobData;
  final BuildContext? context;
  const YourGridViewWithData({super.key, this.jobData, this.context});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Make the GridView unscrollable
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust the number of columns as needed
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio:
            1.0, // This will make the height adaptive based on the width
      ),
      itemCount: jobData?.length ?? 0,
      itemBuilder: (context, index) {
        return buildJobItem(jobData![index], context);
      },
    );
  }

  Widget buildJobItem(JobPost job, BuildContext context) {
    // Extract job details from the document snapshot
    String jobRole = job.jobDomain;
    String salary = job.salary;
    String jobLocation = job.jobLocation;
    String eligibilityCriteria = job.eligibilityCriteria;
    String perks = job.skillset;
    String imageUrl =
        "data:image/jpeg;base64,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";
    String jobid = job.jobid;
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.network(
                imageUrl,
                width: 343.0,
                height: 206.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                context.go('/hrjobview?jobid=$jobid');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => SelectedJobApplicantWidget(
                //             jobid: jobid,
                //           )),
                // );
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 320.0,
                  // height: 67.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Job Role',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            jobRole,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Salary',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  salary,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Job Location',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  jobLocation,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eligibility Criteria',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  eligibilityCriteria,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Perks',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  perks,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class YourListViewWithData extends StatelessWidget {
  final List<JobPost>? jobData;
  final BuildContext? context;
  const YourListViewWithData({super.key, this.jobData, this.context});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      // Make the GridView unscrollable
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3, // Adjust the number of columns as needed
      //   crossAxisSpacing: 10.0,
      //   mainAxisSpacing: 10.0,
      //   childAspectRatio:
      //       1.0, // This will make the height adaptive based on the width
      // ),
      itemCount: jobData?.length ?? 0,
      itemBuilder: (context, index) {
        return buildJobItem(jobData![index], context);
      },
    );
  }

  Widget buildJobItem(JobPost job, BuildContext context) {
    // Extract job details from the document snapshot
    String jobRole = job.jobDomain;
    String salary = job.salary;
    String jobLocation = job.jobLocation;
    String eligibilityCriteria = job.eligibilityCriteria;
    String perks = job.skillset;
    String imageUrl =
        "data:image/jpeg;base64,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";
    String jobid = job.jobid;
    return Container(
      width: 100.0,
      //  height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.network(
                imageUrl,
                width: 343.0,
                height: 206.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                context.go('/hrjobview?jobid=$jobid');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => SelectedJobApplicantWidget(
                //             jobid: jobid,
                //           )),
                // );
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 320.0,
                  // height: 67.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Job Role',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            jobRole,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Salary',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  salary,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Job Location',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  jobLocation,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eligibility Criteria',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  eligibilityCriteria,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Perks',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
                Text(
                  perks,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

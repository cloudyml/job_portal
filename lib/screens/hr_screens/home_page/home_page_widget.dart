import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/contactuspage/contactuspage_widget.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/updateProfile.dart';
import 'package:job_portal_cloudyml/screens/index.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../controllers/businesscontroller.dart';
import '../../../provider/businessprovider.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/drawer.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> imageLinks = [];

  @override
  void initState() {
    super.initState();
   // fetchImageDataFromDatabase();
    _model = createModel(context, () => HomePageModel());
    getEventsForUserAndDate(DateTime.now());

    // Call getBusinessData when the screen is initialized
    _getBusinessData();
  }

  Future<String> _getBusinessData() async {
   // await FirestoreService().getBusinessData(context);
    return "hello";
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  // Fetch data from Firebase Cloud Firestore
  Future<void> fetchImageDataFromDatabase() async {
    try {
      // Replace 'hrjobData_media' and 'hrjobdashboard_carousel_images' with your actual collection and document names
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection('hrjobData_media')
              .doc('hrjobdashboard_carousel_images')
              .get();

      // Assuming 'image_links' is the field you want to retrieve
      List<dynamic> data = documentSnapshot.data()?['image_links'] ?? [];

      setState(() {
        // Convert the dynamic list to a list of strings
        imageLinks = List<String>.from(data);
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  late ValueNotifier<List<String>> _selectedEvents = ValueNotifier(<String>[]);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  TextEditingController _eventController = TextEditingController();
  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');

  Future<void> addEventForUser(DateTime date, String events) async {
    // Convert events to a List<Map<String, dynamic>> for Firestore

    // Add or update the document for the given user and date
    await eventsCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('user_events')
        .doc(formatDate(date))
        .set({
      'events': FieldValue.arrayUnion([events])
    }, SetOptions(merge: true));
    _selectedEvents.value = await getEventsForUserAndDate(date);
  }

  Future<List<String>> getEventsForUserAndDate(DateTime date) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await eventsCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('user_events')
        .doc(formatDate(date))
        .get();

    if (snapshot.exists) {
      List<String> events = [];
      // Convert data from Firestore to a List<Event>
      List<dynamic>? eventsData = snapshot.data()?['events'];

      if (eventsData != null) {
        for (int i = 0; i < eventsData.length; i++) {
          events.add(eventsData[i] as String);
        }
      }

      _selectedEvents.value = events;
      return events;
    } else {
      return [];
    }
  }

  // Helper function to format DateTime to a string for use as Firestore document ID
  String formatDate(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  Future<void> _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = await getEventsForUserAndDate(selectedDay);
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

    return FutureBuilder<String>(
        // Simulating a future that resolves after 2 seconds
        future: _getBusinessData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // If the Future is completed successfully
            return YoutubeFullScreenWrapper(
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
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
                          'DashBoard',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
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
                    child: Container(
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage(
                      //         'assets/images/backgroungimg.png'), // Replace with your image path
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      //   decoration: BoxDecoration(),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context).success,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat: true,
                                    weekStartsMonday: true,
                                    initialDate: getCurrentTimestamp,
                                    rowHeight: 64.0,
                                    selectedDay: _selectedDay,
                                    rangeStart: _rangeStart,
                                    rangeEnd: _rangeEnd,
                                    onDaySelected: _onDaySelected,
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                    dayOfWeekStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    dateStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium,
                                  ),
                                ),
                              ),
                              Container(
                                // width: 778.0,
                                // height: 434.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: FlutterFlowYoutubePlayer(
                                  url:
                                      'https://www.youtube.com/watch?v=busN9EYoZMw&t=178s',
                                  autoPlay: false,
                                  looping: true,
                                  mute: false,
                                  showControls: true,
                                  showFullScreen: true,
                                  strictRelatedVideos: false,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width <
                                            valueOrDefault<double>(
                                              kBreakpointSmall,
                                              1024.0,
                                            )
                                        ? 199.0
                                        : 418.0,
                                    height: 350.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width <
                                                      valueOrDefault<double>(
                                                        kBreakpointSmall,
                                                        1024.0,
                                                      )
                                                  ? 199.0
                                                  : 368.0,
                                          height: 198.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: ValueListenableBuilder<
                                                    List<String>>(
                                                  valueListenable: _selectedEvents,
                                                  builder: (context, value, _) {
                                                    return ListView.builder(
                                                      itemCount: value.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(8),
                                                          ),
                                                          child: Container(
                                                            width: 100,
                                                            height: 38,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize.max,
                                                              children: [
                                                                Icon(
                                                                  Icons.note,
                                                                  color: FlutterFlowTheme
                                                                          .of(context)
                                                                      .secondaryText,
                                                                  size: 24,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  child: Text(
                                                                    '${value[index]}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                        // return Container(
                                                        //   margin: const EdgeInsets.symmetric(
                                                        //     horizontal: 12.0,
                                                        //     vertical: 4.0,
                                                        //   ),
                                                        //   decoration: BoxDecoration(
                                                        //     border: Border.all(),
                                                        //     borderRadius:
                                                        //     BorderRadius.circular(12.0),
                                                        //   ),
                                                        //   child: ListTile(
                                                        //     onTap: () =>
                                                        //         print('${value[index]}'),
                                                        //     title: Text('${value[index]}'),
                                                        //   ),
                                                        // );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            TextField(
                                              controller: _eventController,
                                              decoration: InputDecoration(
                                                hintText: 'Enter the Event',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  if (_selectedDay != null) {
                                                    addEventForUser(
                                                        _selectedDay!,
                                                        _eventController.text);
                                                    _eventController.clear();
                                                  } else {
                                                    // Handle the case where _selectedDay is null
                                                    print(
                                                        'Selected day is null.');
                                                  }
                                                },
                                                text: 'Add Event',
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
            
          }
        });
  }

  Widget buildImageWidget(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        imageUrl,
        width: 300.0,
        height: 277.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

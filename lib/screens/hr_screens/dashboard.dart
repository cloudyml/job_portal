import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../routes/app_routes.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late ValueNotifier<List<String>> _selectedEvents=ValueNotifier(<String>[]);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    settime();
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  settime() async {
    _selectedEvents =
        ValueNotifier(await getEventsForUserAndDate(DateTime.now()));
  }

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
    _selectedEvents =
        ValueNotifier(await getEventsForUserAndDate(date)); 
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
      List<dynamic> eventsData = snapshot.data()?['events'];
      for (int i = 0; i < eventsData!.length; i++) {
        events.add(eventsData[i]);
      }
      _selectedEvents = ValueNotifier(events);
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
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              color: Color.fromARGB(255, 225, 225, 225),
              width: MediaQuery.of(context).size.width * .10,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: 400,
                      child: Image.asset(
                        "assets/images/sidepanel1.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRoutes.hrJobPosting);
                      },
                      child: Container(
                        height: 80,
                        width: 400,
                        child: Image.asset("assets/images/sidepanel2.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: 400,
                      child: Image.asset("assets/images/sidepanel3.png"),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * .80,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child:
                              Image.asset("assets/images/cloudyml_logobg.png"),
                          width: MediaQuery.of(context).size.width * .2,
                        ),
                        Spacer(),
                        Text(
                          'Create and Manage Job Postings',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .2),
                          child: ClipOval(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .05,
                              height: MediaQuery.of(context).size.width * .05,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/photo.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .05),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(1),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Quick Start Guide',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer()
                                      ],
                                    ),
                                  ),
                                  TableCalendar(
                                    headerVisible: false,
                                    firstDay: DateTime.utc(2010, 10, 16),
                                    lastDay: DateTime.utc(2030, 3, 14),
                                    focusedDay: DateTime.now(),

                                    selectedDayPredicate: (day) =>
                                        isSameDay(_selectedDay, day),
                                    rangeStartDay: _rangeStart,
                                    rangeEndDay: _rangeEnd,
                                    calendarFormat: _calendarFormat,
                                    rangeSelectionMode: _rangeSelectionMode,
                                    // eventLoader: _getEventsForDay,
                                    startingDayOfWeek: StartingDayOfWeek.monday,
                                    calendarStyle: CalendarStyle(
                                      // Use `CalendarStyle` to customize the UI
                                      outsideDaysVisible: false,
                                    ),
                                    onDaySelected: _onDaySelected,
                                    //  onRangeSelected: _onRangeSelected,
                                    onFormatChanged: (format) {
                                      if (_calendarFormat != format) {
                                        setState(() {
                                          _calendarFormat = format;
                                        });
                                      }
                                    },
                                    onPageChanged: (focusedDay) {
                                      _focusedDay = focusedDay;
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
                            height: MediaQuery.of(context).size.height * .6,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.height * .6,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Our Top Learners',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .18,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: Column(
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/photo.jpeg",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text("Miley Grey")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .18,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: Column(
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/photo.jpeg",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text("Miley Grey")
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .18,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: Column(
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/photo.jpeg",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text("Miley Grey")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .18,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: Column(
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/photo.jpeg",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text("Miley Grey")
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          height: MediaQuery.of(context).size.height * .6,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ValueListenableBuilder<List<String>>(
                                  valueListenable: _selectedEvents,
                                  builder: (context, value, _) {
                                    return ListView.builder(
                                      itemCount: value.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                            vertical: 4.0,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: ListTile(
                                            onTap: () =>
                                                print('${value[index]}'),
                                            title: Text('${value[index]}'),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              TextField(
                                controller: _eventController,
                                decoration: InputDecoration(
                                  hintText: 'Enter the Event',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  addEventForUser(
                                      _selectedDay!, _eventController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: const Text(
                                  'Add Event',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

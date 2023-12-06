import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          child: Row(children: [
           
              Container(
                color: Color.fromARGB(255, 225, 225, 225),
              width: MediaQuery.of(context).size.width * .10,
              height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Image.asset("assets/images/sidepanel1.png"),
                     Image.asset("assets/images/sidepanel2.png"),
                      Image.asset("assets/images/sidepanel3.png"),
                  ],
                ),
              
            ),
            Container(
              width: MediaQuery.of(context).size.width * .80,
            height: MediaQuery.of(context).size.height,
            child:
           
            SingleChildScrollView(
              child:Column(children: [
              Row(children: [
                Container(child:  Image.asset("assets/images/cloudyml_logobg.png"),
                width: MediaQuery.of(context).size.width * .2,
                ),
               Spacer(),
                Text('Create and Manage Job Postings',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * .2),
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
                )
                        
              ],),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
                child: Row(children: [
                  Container(
                     width: MediaQuery.of(context).size.width * .4,
                     height: MediaQuery.of(context).size.height * .5,
                     decoration: BoxDecoration(
                     color: Colors.grey[100],
                     borderRadius: BorderRadius.circular(10.0),),
                     child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Row(
                                  children: [
                                    Text('Quick Start Guide',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                        Spacer()
                                  ],
                                ),
                              ),
                                  Container(
                                    child: 
                                    TableCalendar(
                                     headerStyle: HeaderStyle(
                                      titleTextStyle: TextStyle(fontSize: 10),
                                      formatButtonVisible: false,
                                      ),
                                      
                                     
                                      
                                   daysOfWeekStyle: DaysOfWeekStyle(
                                    weekendStyle: TextStyle(color: Colors.red,fontSize: 5), 
                                    weekdayStyle: TextStyle(color: Colors.black,fontSize: 5),
                                    ),
                                    firstDay: DateTime.utc(2010, 10, 16),
                                    lastDay: DateTime.utc(2030, 3, 14),
                                    focusedDay: DateTime.now(),
                                  ),
                                  )
                            ],),
                          ),
                  )
                ],),
              )
              ],)
            )
            )
          ],)
          ),
    );
  }
}


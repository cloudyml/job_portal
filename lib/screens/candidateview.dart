import 'package:flutter/material.dart';
import 'package:job_portal_cloudyml/screens/jobposting.dart';

class Candidateview extends StatefulWidget {
  const Candidateview({super.key});

  @override
  State<Candidateview> createState() => _CandidateviewState();
}

class _CandidateviewState extends State<Candidateview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    SingleChildScrollView(
      child: Row(children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Jobposting()));
            },
            child: Container(
              color: Color.fromARGB(255, 225, 225, 225),
            width: MediaQuery.of(context).size.width * .10,
            height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/sidepanel.png"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .80,
          height: MediaQuery.of(context).size.height,
          child:
          Image.asset("assets/images/candidateview.png",fit: BoxFit.fitHeight,)
          // SingleChildScrollView(
          //   child:Column(children: [
          //   Row(children: [
          //     Container(child:  Image.asset("assets/images/cloudyml_logobg.png"),
          //     width: MediaQuery.of(context).size.width * .2,
          //     ),
          //    Spacer(),
          //     Text('Create and Manage Job Postings',
          //                   style: TextStyle(
          //                       fontSize: 20,
          //                       color: Colors.black,
          //                       fontWeight: FontWeight.bold)),
          //     Padding(
          //       padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
          //       child: ClipOval(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * .05,
          //             height: MediaQuery.of(context).size.width * .05,
          //             decoration: BoxDecoration(
                        
          //               border: Border.all(
          //                 color: Colors.black,
          //                 width: 1.0,
          //               ),
          //             ),
          //             child: Image.asset(
          //               "assets/images/photo.jpeg",
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //     )
                      
          //   ],),
          //   Padding(
          //     padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
          //     child: Row(children: [
          //       Container(
          //          width: MediaQuery.of(context).size.width * .4,
          //               height: MediaQuery.of(context).size.height * .5,
          //                   decoration: BoxDecoration(
          //                      color: Colors.grey[100],
          //               borderRadius: BorderRadius.circular(10.0),),
          //               child: Padding(
          //                 padding: EdgeInsets.all(8.0),
          //                 child: Column(children: [
          //                   Padding(
          //                     padding: const EdgeInsets.all(1),
          //                     child: Row(
          //                       children: [
          //                         Text('Quick Start Guide',
          //                         style: TextStyle(
          //                             fontSize: 20,
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.bold)),
          //                             Spacer()
          //                       ],
          //                     ),
          //                   ),
          //                       Container(
          //                       //   child: TableCalendar(
          //                       //    headerStyle: HeaderStyle(
          //                       //     titleTextStyle: TextStyle(fontSize: 10),
          //                       //     formatButtonVisible: false,
          //                       //     ),
                                    
                                   
                                    
          //                       //  daysOfWeekStyle: DaysOfWeekStyle(
          //                       //   weekendStyle: TextStyle(color: Colors.red,fontSize: 5), 
          //                       //   weekdayStyle: TextStyle(color: Colors.black,fontSize: 5),
          //                       //   ),
          //                       //   firstDay: DateTime.utc(2010, 10, 16),
          //                       //   lastDay: DateTime.utc(2030, 3, 14),
          //                       //   focusedDay: DateTime.now(),
          //                       // ),
          //                       )
          //                 ],),
          //               ),
          //       )
          //     ],),
          //   )
          //   ],)
          // )
          )
        ],),
    ),);
  }
}
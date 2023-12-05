import 'package:flutter/material.dart';
import 'package:job_portal_cloudyml/screens/candidateview.dart';

class Jobposting extends StatefulWidget {
  const Jobposting({super.key});

  @override
  State<Jobposting> createState() => _JobpostingState();
}

class _JobpostingState extends State<Jobposting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    SingleChildScrollView(
      child: InkWell(
         onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Candidateview()));
          },
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.asset("assets/images/joposting1.png", width:  MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth, ),
                 InkWell(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>Candidateview()));
                  },
                  child:Image.asset("assets/images/jobposting2.png", width:  MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth, ),),
                   Image.asset("assets/images/jobposting3.png", width:  MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth, ),
        
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
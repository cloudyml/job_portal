import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/ApplicantView.dart';

import '../../routes/app_routes.dart';

class CandidatePage extends StatefulWidget {
  @override
  _CandidatePageState createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  List<Candidate> candidates = [
    Candidate(
        name: 'John Doe',
        positionApplied: 'Software Developer',
        status: 'Not Viewed'),
    Candidate(
        name: 'Jane Doe',
        positionApplied: 'UI/UX Designer',
        status: 'Not Viewed'),
    Candidate(
        name: 'John Doe',
        positionApplied: 'Software Developer',
        status: 'Not Viewed'),
    Candidate(
        name: 'Jane Doe',
        positionApplied: 'UI/UX Designer',
        status: 'Not Viewed'),
    Candidate(
        name: 'John Doe',
        positionApplied: 'Software Developer',
        status: 'Not Viewed'),
    Candidate(
        name: 'Jane Doe',
        positionApplied: 'UI/UX Designer',
        status: 'Not Viewed'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Candidate Details',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRoutes.hrJobPosting);
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            child: CandidateCard(
                candidate: candidates[index], onStatusChanged: _updateStatus),
          );
        },
      ),
    );
  }

  void _updateStatus(Candidate candidate, String newStatus) {
    setState(() {
      candidate.status = newStatus;
    });
  }
}

class CandidateCard extends StatelessWidget {
  final Candidate candidate;
  final Function(Candidate, String) onStatusChanged;

  const CandidateCard({required this.candidate, required this.onStatusChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 300,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            height: 300,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text('Name: ${candidate.name}'),
                Text('Position: ${candidate.positionApplied}'),
                Text('Status: ${candidate.status}'),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => onStatusChanged(candidate, 'Not Viewed'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Not Viewed'),
                    ),
                    ElevatedButton(
                      onPressed: () => onStatusChanged(candidate, 'Reviewing'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Reviewing'),
                    ),
                    ElevatedButton(
                      onPressed: () => onStatusChanged(candidate, 'Accepted'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Accepted'),
                    ),
                    ElevatedButton(
                      onPressed: () => onStatusChanged(candidate, 'Rejected'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Rejected'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CandidateDetailPage(candidate: candidate),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: Text('View Details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Candidate {
  final String name;
  final String positionApplied;
  String status;

  Candidate(
      {required this.name,
      required this.positionApplied,
      required this.status});
}

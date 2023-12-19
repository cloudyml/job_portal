import 'package:flutter/material.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/ApplicantView.dart';

class CandidatePage extends StatefulWidget {
  @override
  _CandidatePageState createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  List<Candidate> candidates = [
    Candidate(name: 'John Doe', positionApplied: 'Software Developer', status: 'Not Viewed'),
    Candidate(name: 'Jane Doe', positionApplied: 'UI/UX Designer', status: 'Not Viewed'),
    // Add more candidates as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate List'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return CandidateCard(candidate: candidates[index], onStatusChanged: _updateStatus);
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
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${candidate.name}'),
            Text('Position: ${candidate.positionApplied}'),
            Text('Status: ${candidate.status}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => onStatusChanged(candidate, 'Not Viewed'),
                  child: Text('Not Viewed'),
                ),
                ElevatedButton(
                  onPressed: () => onStatusChanged(candidate, 'Reviewing'),
                  child: Text('Reviewing'),
                ),
                ElevatedButton(
                  onPressed: () => onStatusChanged(candidate, 'Accepted'),
                  child: Text('Accepted'),
                ),
                ElevatedButton(
                  onPressed: () => onStatusChanged(candidate, 'Rejected'),
                  child: Text('Rejected'),
                ),
              ],
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CandidateDetailPage(candidate: candidate),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}


class Candidate {
  final String name;
  final String positionApplied;
  String status;

  Candidate({required this.name, required this.positionApplied, required this.status});
}

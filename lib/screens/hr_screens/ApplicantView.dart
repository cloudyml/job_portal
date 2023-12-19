import 'package:flutter/material.dart';

import 'jobcandidate.dart';

class CandidateDetailPage extends StatefulWidget {
  final Candidate candidate;

  const CandidateDetailPage({required this.candidate});

  @override
  State<CandidateDetailPage> createState() => _CandidateDetailPageState();
}

class _CandidateDetailPageState extends State<CandidateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(
          'Candidate Details',
          style: TextStyle(color: Colors.red), // Set title text color to red
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red, // Set appbar background color to white
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.red[200]!],
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDetailRow('Name', widget.candidate.name),
                  _buildDetailRow('Position', widget.candidate.positionApplied),
                  _buildDetailRow('Status', widget.candidate.status),
                  // Add more details as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

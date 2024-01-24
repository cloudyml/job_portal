import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class CandidateSearchPage extends StatefulWidget {
  @override
  _CandidateSearchPageState createState() => _CandidateSearchPageState();
}

class _CandidateSearchPageState extends State<CandidateSearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Candidate> allCandidates = [
    Candidate(name: 'John Doe', skills: 'Flutter, Dart, UI/UX', experience: 2, location: 'CityA'),
    Candidate(name: 'Jane Smith', skills: 'Java, Kotlin, Android', experience: 3, location: 'CityB'),
    // Add more candidates as needed
  ];
  List<Candidate> searchResults = [];

  String selectedSkill = '';
  int selectedExperience = 0;
  String selectedLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Candidate search',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      // Call a function to perform search based on the input
                      performSearch();
                    },
                    decoration: InputDecoration(
                      labelText: 'Search Candidates',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // Clear search input and reset filters
                    _searchController.clear();
                    setState(() {
                      selectedSkill = '';
                      selectedExperience = 0;
                      selectedLocation = '';
                    });
                    performSearch();
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            _buildFilters(),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index].name),
                    subtitle: Text(
                      'Skills: ${searchResults[index].skills}, '
                      'Experience: ${searchResults[index].experience} years, '
                      'Location: ${searchResults[index].location}',
                    ),
                    // Add more candidate details as needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      children: [
        _buildFilterButton('Skills', selectedSkill, () => _showSkillsDialog()),
        SizedBox(width: 16.0),
        _buildFilterButton('Experience', selectedExperience.toString(), () => _showExperienceDialog()),
        SizedBox(width: 16.0),
        _buildFilterButton('Location', selectedLocation, () => _showLocationDialog()),
      ],
    );
  }

  Widget _buildFilterButton(String title, String value, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
             Colors.red,
      ),
      child: Text('$title: $value'),
    );
  }

  void _showSkillsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Skills'),
          content: SingleChildScrollView(
            child: Column(
              children: allCandidates
                  .expand((candidate) => candidate.skills.split(', '))
                  .toSet()
                  .map((skill) => ListTile(
                        title: Text(skill),
                        onTap: () {
                          setState(() {
                            selectedSkill = skill;
                          });
                          GoRouter.of(context).pop();
                          performSearch();
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  void _showExperienceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Experience'),
          content: SingleChildScrollView(
            child: Column(
              children: [1, 2, 3, 4, 5].map((experience) {
                return ListTile(
                  title: Text('$experience years'),
                  onTap: () {
                    setState(() {
                      selectedExperience = experience;
                    });
                    GoRouter.of(context).pop();
                    performSearch();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Location'),
          content: SingleChildScrollView(
            child: Column(
              children: allCandidates
                  .map((candidate) => candidate.location)
                  .toSet()
                  .map((location) => ListTile(
                        title: Text(location),
                        onTap: () {
                          setState(() {
                            selectedLocation = location;
                          });
                          GoRouter.of(context).pop();
                          performSearch();
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  void performSearch() {
    // Clear previous search results
    setState(() {
      searchResults.clear();
    });

    // Perform the search based on the query and filters
    if (_searchController.text.isNotEmpty) {
      for (var candidate in allCandidates) {
        if (candidate.name.toLowerCase().contains(_searchController.text.toLowerCase()) &&
            (selectedSkill.isEmpty || candidate.skills.toLowerCase().contains(selectedSkill.toLowerCase())) &&
            (selectedExperience == 0 || candidate.experience == selectedExperience) &&
            (selectedLocation.isEmpty || candidate.location.toLowerCase().contains(selectedLocation.toLowerCase()))) {
          setState(() {
            searchResults.add(candidate);
          });
        }
      }
    }
  }
}

class Candidate {
  final String name;
  final String skills;
  final int experience;
  final String location;

  Candidate({required this.name, required this.skills, required this.experience, required this.location});
}
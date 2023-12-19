import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class JobPostingView extends StatefulWidget {
  const JobPostingView({super.key});

  @override
  State<JobPostingView> createState() => _JobPostingViewState();
}

class _JobPostingViewState extends State<JobPostingView> {
  final _formKey = GlobalKey<FormState>();
  List<String> companyBenefits = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Job Posting',
          style: TextStyle(
            color: Colors.red, // Set text color to red
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        iconTheme: IconThemeData(color: Colors.red), // Set icon color to white
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle drawer button press
              // You can open the drawer here
              _scaffoldKey.currentState!.openDrawer();
            },
            tooltip: 'Open Drawer',
          ),
        ),
        centerTitle: true,
        elevation: 8.0, // Add a shadow to the AppBar
        backgroundColor: Colors.white, // Set background color to red
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 225, 225, 225),
          width: MediaQuery.of(context).size.width * .10,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRoutes.hrDashboard);
                  },
                  child: Container(
                    height: 80,
                    width: 400,
                    child: Image.asset("assets/images/sidepanel1.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRoutes.hrJobView);
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _buildTextField('Education Required',
                    'Enter education requirements', Icons.school),
                _buildTextField(
                    'Eligibility', 'Enter eligibility criteria', Icons.person),
                _buildTextField('Job Description', 'Enter job description',
                    Icons.description),
                _buildTextField('Job Domain', 'Enter job domain', Icons.work),
                _buildTextField(
                    'Job Location', 'Enter job location', Icons.location_on),
                _buildNumberField('Number of Openings',
                    'Enter number of openings', Icons.people),
                _buildTextField('Offered Salary', 'Enter offered salary',
                    Icons.attach_money),
                _buildTextField('Required Experience',
                    'Enter required experience', Icons.access_time),
                _buildTextField(
                    'Skillset', 'Enter required skillset', Icons.star),
                _buildTextField(
                    'Streams', 'Enter applicable streams', Icons.category),
                _buildTextField(
                    'Year of Passing', 'Enter year of passing', Icons.event),
                _buildCompanyBenefitsField(),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                      // For now, print the data to the console
                      print('Form data submitted');
                      print('Company Benefits: $companyBenefits');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors
                              .green; // Color when the button is hovered
                        }
                        return Colors.red; // Default color
                      },
                    ),
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildNumberField(String label, String hint, IconData icon) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (int.tryParse(value) == null) {
          return 'Please enter a valid number for $label';
        }
        return null;
      },
    );
  }

  Widget _buildCompanyBenefitsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Company Benefits'),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter a benefit'),
                onFieldSubmitted: (value) {
                  setState(() {
                    companyBenefits.add(value);
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Add benefit to the list
                _addCompanyBenefit();
              },
            ),
          ],
        ),
        _buildCompanyBenefitsList(),
      ],
    );
  }

  Widget _buildCompanyBenefitsList() {
    if (companyBenefits.isEmpty) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        Text('Added Benefits:'),
        Column(
          children:
              companyBenefits.map((benefit) => Text('- $benefit')).toList(),
        ),
      ],
    );
  }

  void _addCompanyBenefit() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Company Benefit'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter a benefit'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  companyBenefits.add(controller.text);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '../../controllers/businesscontroller.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../provider/businessprovider.dart';
import '../../routes/app_routes.dart';
import '../../utils/drawer.dart';
import 'contactuspage/contactuspage_widget.dart';
import 'data_page/data_page_widget.dart';
import 'home_page/home_page_widget.dart';
import 'job_recommendation/job_recommendation_widget.dart';

class JobPostingView extends StatefulWidget {
  const JobPostingView({super.key});

  @override
  State<JobPostingView> createState() => _JobPostingViewState();
}

class _JobPostingViewState extends State<JobPostingView> {
  double _minSalary = 2.0;
  double _maxSalary = 80.0;
  final _formKey = GlobalKey<FormState>();
  List<String> companyBenefits = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String eligibilityCriteria = 'Non';
  List<String> educationList = [];
  String interviewType = 'In-person Interviews';
  List<String> questions = [];
  List<String> skillSet = [];
  final TextEditingController _buildTextFieldController =
      TextEditingController();
  final TextEditingController _jobDomainController = TextEditingController();
  final TextEditingController _jobLocationController = TextEditingController();
  final TextEditingController _numOpeningsController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _skillsetController = TextEditingController();
  final TextEditingController _streamsController = TextEditingController();
  final TextEditingController _yearOfPassingController =
      TextEditingController();
     @override
  void initState() {
    super.initState();
    // Call getBusinessData when the screen is initialized
    _getBusinessData();
  }
FirestoreService firestoreService = FirestoreService();

  Future<void> _getBusinessData() async {
    await firestoreService.getBusinessData();
     setState(() {});
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
  //  final businessData = Provider.of<BusinessProvider>(context).businessData;
    return Scaffold(
      key: scaffoldKey,
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
              buttonSize: 48.0,
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
              'Jobs Posted',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
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
      drawer: WebViewAware(
            child: Drawer(
          elevation: 16.0,
          child: DrawerWidget(scaffoldKey: scaffoldKey,)
        )),
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
                _buildEligibilityContainer(),
                SizedBox(height: 10),
                _buildJobDescriptionContainer(_buildTextFieldController),
                SizedBox(height: 10),
                _buildTextField('Job Domain', 'Enter job domain', Icons.work,
                    _jobDomainController),
                SizedBox(height: 10),
                _buildInterviewTypeDropdown(),
                SizedBox(height: 10),
                _buildTextField('Job Location', 'Enter job location',
                    Icons.location_on, _jobLocationController),
                SizedBox(height: 10),
                _buildNumberField(
                    'Number of Openings',
                    'Enter number of openings',
                    Icons.people,
                    _numOpeningsController),
                SizedBox(height: 10),
                _buildsalary(),
                SizedBox(height: 10),
                _buildNumberField(
                    'Required Experience',
                    'Enter years of required experience',
                    Icons.access_time,
                    _expController),
                SizedBox(height: 10),
                _skillset(),
                SizedBox(height: 10),
                _buildTextField('Streams', 'Enter applicable streams',
                    Icons.category, _streamsController),
                SizedBox(height: 10),
                _buildTextField('Year of Passing', 'Enter year of passing',
                    Icons.event, _yearOfPassingController),
                SizedBox(height: 10),
                _buildCompanyBenefitsField(),
                SizedBox(height: 10),
                _buildEducationField(),
                SizedBox(height: 16.0),
                _questionswidget(),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, print the values
                      print('Form data submitted');
                      print('Eligibility Criteria: $eligibilityCriteria');
                      print(
                          'Job Description: ${_buildTextFieldController.text}');
                      print('Job Domain: ${_jobDomainController.text}');
                      print('Interview Type: $interviewType');
                      print('Job Location: ${_jobLocationController.text}');
                      print(
                          'Number of Openings: ${_numOpeningsController.text}');
                      print('Salary Range: $_minSalary LPA - $_maxSalary LPA');
                      print('Required Experience: ${_expController.text}');
                      print('Skillset: ${_skillsetController.text}');
                      print('Streams: ${_streamsController.text}');
                      print(
                          'Year of Passing: ${_yearOfPassingController.text}');
                      print('Company Benefits: $companyBenefits');
                      print('Education List: ${educationList.join('/')}');
                      // Form is valid, add data to Firestore
                      final FirestoreService firestoreService =
                          FirestoreService();

                      // Create a map with the form data
                      Map<String, dynamic> formData = {
                        'job_id':'',                        'eligibility': eligibilityCriteria,
                        'job_description': _buildTextFieldController.text,
                        'job_domain': _jobDomainController.text,
                        'interview_type': interviewType,
                        'job_location': _jobLocationController.text,
                        'number_of_openings':
                            int.parse(_numOpeningsController.text),
                        'offered_salary':
                            "upto ${_minSalary}-${_maxSalary} LPA",
                        'required_exp': _expController.text,
                        'skill_set':skillSet,
                        'streams': _streamsController.text,
                        'year_of_passing': _yearOfPassingController.text,
                        'company_benefits': companyBenefits,
                        'job_questions': questions,
                        'education': educationList.join('/'),
                        'company_name': firestoreService.businessData1!.organizationName,
                        'about_company': firestoreService.businessData1!.description,
                        'number_students_applied': 0,
                        'posted_by':
                            '${firestoreService.businessData1!.firstName} ${firestoreService.businessData1!.lastName}',
                        'posted_on': DateTime.now(),
                        'hr_id': FirebaseAuth.instance.currentUser!.uid
                      };
                      final CollectionReference jobsCollection =
                          FirebaseFirestore.instance
                              .collection('jobsData_jobportal');

                      DocumentReference documentReference =
                          await jobsCollection.add({
                        "job_information": [formData]
                      });
                      String jobId = documentReference.id;
                      
                      // Update the 'job_id' field with the document ID
                      await documentReference.update({'jobid': jobId});
                      await documentReference
                          .update({"posted_on": DateTime.now()});
                      await documentReference.update(
                          {"hr_id": FirebaseAuth.instance.currentUser!.uid});
                          await documentReference.update({
  'job_information': [
    {
      ...formData['job_information'][0],
      'jobid': jobId,
    }
  ]
});
                      // Show a success message or navigate to a new screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Form data submitted successfully!'),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.green;
                        }
                        return Colors.teal;
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

  Widget _buildTextField(String label, String hint, IconData icon,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color:Colors.black),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          icon,
        ), // Set icon color
        labelStyle: TextStyle(color: Colors.teal), // Set label color
        enabledBorder: OutlineInputBorder(
          //  borderSide: BorderSide(color: Colors.teal), // Set border color
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.teal), // Set focused border color
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _skillset() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skill Set'),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Added Skills:'),
                      SizedBox(height: 8.0),
                      Wrap(
                        spacing: 8.0,
                        children: skillSet
                            .map(
                              (skill) => SkillSetBubble(
                                skill: skill,
                                onDelete: () {
                                  setState(() {
                                    skillSet.remove(skill);
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.teal,
              ),
              onPressed: () {
                _addSkill();
              },
            ),
          ],
        ),
      ],
    );
  }
   void _addSkill() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Skill'),
          content: TextField(
             style: TextStyle(color:Colors.black),
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter a skill'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  skillSet.add(controller.text);
                });
               GoRouter.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                 GoRouter.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNumberField(String label, String hint, IconData icon,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
       style: TextStyle(color:Colors.black),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        // prefixIcon: Icon(icon, color: Colors.teal),
        labelStyle: TextStyle(color: Colors.teal),
        enabledBorder: OutlineInputBorder(
          //  borderSide: BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
        Text(
          'Company Benefits',
          // style: TextStyle(color: Colors.teal),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter a benefit',
                  enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onFieldSubmitted: (value) {
                  setState(() {
                    companyBenefits.add(value);
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.teal),
              onPressed: () {
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
        Wrap(
          spacing: 8.0, // Adjust spacing as needed
          children: companyBenefits
              .map(
                (benefit) => Chip(
                  label: Text(benefit),
                  deleteIcon: Icon(Icons.clear),
                  onDeleted: () {
                    setState(() {
                      companyBenefits.remove(benefit);
                    });
                  },
                ),
              )
              .toList(),
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
             style: TextStyle(color:Colors.black),
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter a benefit'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  companyBenefits.add(controller.text);
                });
                GoRouter.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                 GoRouter.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEligibilityContainer() {
    return Container(
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        //  border: Border.all(color: Colors.teal),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Eligibility',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 16.0),
          Container(
            width: 150.0,
            child: DropdownButtonFormField<String>(
              value: eligibilityCriteria,
              items: [
                'Non',
                '40% Overall',
                '50% Overall',
                '60% Overall',
                '70% Overall',
                '80% Overall',
                '90% Overall',
              ].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  eligibilityCriteria = value!;
                });
              },
              // dropdownColor: Colors.black,
              icon: Icon(Icons.arrow_drop_down, color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobDescriptionContainer(TextEditingController conytroller) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildTextField('Job Description', 'Enter job description',
            Icons.description, conytroller),
      ),
    );
  }

  Widget _buildEducationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Education'),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selected Education:'),
                      SizedBox(height: 8.0),
                      Wrap(
                        spacing: 8.0,
                        children: educationList
                            .map(
                              (education) => Chip(
                                label: Text(education),
                                deleteIcon: Icon(Icons.clear),
                                onDeleted: () {
                                  setState(() {
                                    educationList.remove(education);
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.teal,
              ),
              onPressed: () {
                _addEducation();
              },
            ),
          ],
        ),
      ],
    );
  }

  void _addEducation() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Education'),
          content: Column(
            children: [
              Text('Select Education:'),
              DropdownButton<String>(
                items: [
                  'BCA',
                  'MCA',
                  'B.Tech',
                  'M.Tech',
                  'B.Sc',
                  'M.Sc',
                  'PhD',
                  'Not listed'
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black),),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  controller.text = value!;
                },
              ),
              SizedBox(height: 8.0),
              Text('Not listed? Type here:'),
              TextField(
                 style: TextStyle(color:Colors.black),
                controller: controller,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  educationList.add(controller.text);
                });
                GoRouter.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildsalary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Salary Range',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_minSalary.toInt()} LPA',
            ),
            Text(
              '${_maxSalary.toInt()} LPA',
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.teal,
            inactiveTrackColor: Colors.white,
            thumbColor: Colors.teal,
            overlayColor: Colors.teal.withOpacity(0.2),
            valueIndicatorColor: Colors.teal,
          ),
          child: RangeSlider(
            values: RangeValues(_minSalary, _maxSalary),
            onChanged: (RangeValues values) {
              setState(() {
                _minSalary = values.start;
                _maxSalary = values.end;
              });
            },
            min: 2.0,
            max: 80.0,
            divisions: 78,
            labels: RangeLabels(
              '${_minSalary.toInt()} LPA',
              '${_maxSalary.toInt()} LPA',
            ),
          ),
        ),
      ],
    );
  }

  void _addQuestion() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Question'),
          content: TextField(
             style: TextStyle(color:Colors.black),
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter a question'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  questions.add(controller.text);
                });
                 GoRouter.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _questionswidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Questions'),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Added Questions:'),
                      SizedBox(height: 8.0),
                      Wrap(
                        spacing: 8.0,
                        children: questions
                            .map(
                              (question) => QuestionBubble(
                                question: question,
                                onDelete: () {
                                  setState(() {
                                    questions.remove(question);
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.teal,
              ),
              onPressed: () {
                _addQuestion();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInterviewTypeDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Interview Type',
              style: TextStyle(color: Colors.black),
            ),
          ),
       //   SizedBox(width: 16.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  //  border: Border.all(color: Colors.teal),
                  color: Colors.white,
                ),
                child: DropdownButtonFormField<String>(
                  value: interviewType,
                  items: [
                    'In-person Interviews',
                    'Phone Interviews',
                    'Virtual Interviews',
                    'Panel Interviews',
                    'Informal Interviews',
                  ].map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      interviewType = value!;
                    });
                  },
                  // dropdownColor: Colors.teal,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.teal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionBubble extends StatelessWidget {
  final String question;
  final VoidCallback onDelete;

  const QuestionBubble({
    required this.question,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(question),
      deleteIcon: Icon(Icons.clear),
      onDeleted: onDelete,
    );
  }
}
class SkillSetBubble extends StatelessWidget {
  final String skill;
  final VoidCallback onDelete;

  const SkillSetBubble({
    required this.skill,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      deleteIcon: Icon(Icons.clear),
      onDeleted: onDelete,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class JobPosting extends StatefulWidget {
  const JobPosting({super.key});

  @override
  State<JobPosting> createState() => _JobPostingState();
}

class _JobPostingState extends State<JobPosting> {
  final List<JobPost> jobPosts = [
    JobPost(
      title: 'Software Engineer',
      company: 'ABC Corp',
      location: 'CityA',
      salary: '\$80,000 - \$100,000',
      imageUrl: 'https://d3kqdc25i4tl0t.cloudfront.net/articles/content/517_240659_tech.hero.jpg',
    ),
    JobPost(
      title: 'HR Manager',
      company: 'XYZ Inc',
      location: 'CityB',
      salary: '\$70,000 - \$90,000',
      imageUrl: 'https://d3kqdc25i4tl0t.cloudfront.net/articles/content/517_240659_tech.hero.jpg',
    ),
    // Add more JobPost objects as needed
  ];

    final _formKey = GlobalKey<FormState>();
  List<String> companyBenefits = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar:AppBar(
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

  actions: [
     
                     
                      Container(
                        child: CreateJobButton(),
                      ),
                     
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      )
                  
                
  ],
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
                    child: Container(
                      height: 80,
                      width: 400,
                      child: Image.asset("assets/images/sidepanel1.png",color: Colors.white,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
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
        body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: jobPosts.length,
        itemBuilder: (context, index) {
          return JobPostCard(jobPost: jobPosts[index]);
        },
        padding: EdgeInsets.all(16.0),
      ),
    );
  }
}
class JobPostCard extends StatelessWidget {
  final JobPost jobPost;

  const JobPostCard({required this.jobPost});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         GoRouter.of(context).pushReplacement(AppRoutes.hrjobcandidateview);
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // You can adjust the aspect ratio as needed
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.network(
                  jobPost.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobPost.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Company: ${jobPost.company}'),
                  Text('Location: ${jobPost.location}'),
                  Text('Salary: ${jobPost.salary}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobPost {
  final String title;
  final String company;
  final String location;
  final String salary;
  final String imageUrl;

  JobPost({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.imageUrl,
  });
}
class CreateJobButton extends StatefulWidget {
  @override
  _CreateJobButtonState createState() => _CreateJobButtonState();
}

class _CreateJobButtonState extends State<CreateJobButton> {
  Color _buttonColor = Colors.red;

  void _changeColor() {
    setState(() {
      _buttonColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _changeColor,
      onLongPress: _changeColor,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return Colors.green.withOpacity(0.8);
            }
            return _buttonColor;
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Create Job Posting',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

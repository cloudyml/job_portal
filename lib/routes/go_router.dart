// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/routes/app_routes.dart';
import 'package:job_portal_cloudyml/screens/detailed_job/detailed_job.dart';
import 'package:job_portal_cloudyml/screens/home/home.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/ApplicantSearch.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/JobPosting.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/JobPostingview.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/dashboard.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/login_hr.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/signup_hr.dart';
import 'package:job_portal_cloudyml/screens/profile/profile.dart';
import 'package:job_portal_cloudyml/screens/student_login/login.dart';
import 'package:job_portal_cloudyml/screens/student_login/signup.dart';
import 'package:job_portal_cloudyml/wrapper.dart';

import '../model/applicantmodel.dart';
import '../screens/hr_screens/applicant_screen/applicant_screen_widget.dart';
import '../screens/hr_screens/contactuspage/contactuspage_widget.dart';
import '../screens/hr_screens/data_page/data_page_widget.dart';
import '../screens/hr_screens/home_page/home_page_widget.dart';
import '../screens/hr_screens/jobcandidate.dart';
import '../screens/hr_screens/search_page/search_page_widget.dart';
import '../screens/hr_screens/selected_job_applicant/selected_job_applicant_widget.dart';
import '../screens/hr_screens/updateProfile.dart';
import 'login_state_check.dart';

class MyRouter {
  final LoginState loginState;

  MyRouter(this.loginState);

  late final GoRouter routes = GoRouter(
    initialLocation: AppRoutes.initialRoute,
    refreshListenable: loginState,
    redirect: (context, GoRouterState state) {
      final loggedIn = loginState.loggedIn;
      final goingToLogin = state.location == (AppRoutes.authWrapper);
      String currentURL = html.window.location.href;

      // if (currentURL.contains(AppRoutes.studentSignup)) {
      //   return (AppRoutes.studentSignup);
      // } else {
      //   if (!loggedIn && !goingToLogin) {
      //     return (AppRoutes.authWrapper);
      //   } else if (loggedIn && goingToLogin) {
      //     if (userRole.value == "student") {
      //       return (AppRoutes.studentHome);
      //     } else if (userRole.value == "HR") {
      //       return (AppRoutes.hrDashboard);
      //     }
      //   } else {
      //     return null;
      //   }
      // }
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.initialRoute,
        pageBuilder: (context, state) {
          return MaterialPage(child: AuthWrapper());
        },
      ),
      GoRoute(
        path: AppRoutes.authWrapper,
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginHR());
        },
      ),
      GoRoute(
        path: AppRoutes.studentSignup,
        pageBuilder: (context, state) {
          return MaterialPage(child: StudentSignupScreen());
        },
      ),
      GoRoute(
        path: AppRoutes.studentProfile,
        pageBuilder: (context, state) {
          return MaterialPage(child: ProfileScreen());
        },
      ),
      GoRoute(
        path: AppRoutes.studentHome,
        pageBuilder: (context, state) {
          return MaterialPage(child: StudentHomeScreen());
        },
      ),
      GoRoute(
        path: AppRoutes.studentLogin,
        pageBuilder: (context, state) {
          return MaterialPage(child: StudentLoginScreen());
        },
      ),
      GoRoute(
        path: AppRoutes.hrJobPosting,
        pageBuilder: (context, state) {
          return MaterialPage(child: DataPageWidget());
        },
      ),
        GoRoute(
        path: AppRoutes.hrupdateprofile,
        pageBuilder: (context, state) {
          return MaterialPage(child: updateProfile());
        },
      ),
     GoRoute(
  path: AppRoutes.hrJobView,
  pageBuilder: (context, state,) {
     String id = state.queryParameters["jobid"]!;
    return MaterialPage(
      child: SelectedJobApplicantWidget(jobid: id,),
      arguments: id,
    );
  },
),
      GoRoute(
        path: AppRoutes.hrApplicantSearch,
        pageBuilder: (context, state) {
          return MaterialPage(child:SearchPageWidget());
        },
      ),
        GoRoute(
        path: AppRoutes.hrjobcandidateview,
        pageBuilder: (context, state) {
          ApplicantModel applicant=state.extra as ApplicantModel;
          return MaterialPage(child:ApplicantScreenWidget(applicant:applicant));
        },
      ),
      GoRoute(
        path: AppRoutes.hrhomepage,
        pageBuilder: (context, state) {
         
          return MaterialPage(child:HomePageWidget());
        },
      ),

      GoRoute(
        path: AppRoutes.hrcontactus,
        pageBuilder: (context, state) {
          return MaterialPage(child:ContactuspageWidget());
        },
      ),
     
      GoRoute(
        path: AppRoutes.hrDashboard,
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePageWidget());
        },
      ),
       GoRoute(
        path: AppRoutes.hrJobPost,
        pageBuilder: (context, state) {
          return MaterialPage(child: JobPostingView());
        },
      ),
      GoRoute(
        path: AppRoutes.hrSignUP,
        pageBuilder: (context, state) {
          return MaterialPage(child: SignupHR());
        },
      ),
     
    ],
  );
}

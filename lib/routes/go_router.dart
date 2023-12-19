// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/routes/app_routes.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/ApplicantSearch.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/ApplicantView.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/JobPosting.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/JobPostingview.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/dashboard.dart';
import 'package:job_portal_cloudyml/screens/home/home.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/login_hr.dart';
import 'package:job_portal_cloudyml/screens/profile/profile.dart';
import 'package:job_portal_cloudyml/screens/hr_screens/signup_hr.dart';
import 'package:job_portal_cloudyml/screens/student_login/login.dart';
import 'package:job_portal_cloudyml/screens/student_login/signup.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:job_portal_cloudyml/wrapper.dart';

import '../screens/hr_screens/jobcandidate.dart';
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

      if (currentURL.contains(AppRoutes.studentSignup)) {
        return (AppRoutes.studentSignup);
      } else {
        if (!loggedIn && !goingToLogin) {
          return (AppRoutes.authWrapper);
        } else if (loggedIn && goingToLogin) {
          if (userRole.value == "student") {
            return (AppRoutes.studentHome);
          } else if (userRole.value == "HR") {
            return (AppRoutes.hrDashboard);
          }
        } else {
          return null;
        }
      }
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
          return MaterialPage(child: JobPosting());
        },
      ),
      GoRoute(
        path: AppRoutes.hrJobView,
        pageBuilder: (context, state) {
          return MaterialPage(child: JobPostingView());
        },
      ),
      GoRoute(
        path: AppRoutes.hrApplicantSearch,
        pageBuilder: (context, state) {
          return MaterialPage(child:CandidateSearchPage());
        },
      ),
        GoRoute(
        path: AppRoutes.hrjobcandidateview,
        pageBuilder: (context, state) {
          return MaterialPage(child:CandidatePage());
        },
      ),
     
      GoRoute(
        path: AppRoutes.hrDashboard,
        pageBuilder: (context, state) {
          return MaterialPage(child: DashBoard());
        },
      ),
      GoRoute(
        path: AppRoutes.hrSignUP,
        pageBuilder: (context, state) {
          return MaterialPage(child: SignupHR());
        },
      ),
      GoRoute(
        path: AppRoutes.hrcandidateview,
        pageBuilder: (context, state) {
          return  MaterialPage(child: CandidatePage());
        },
      ),
    ],
  );
}

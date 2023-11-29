import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // dashboardcNq (205:288)
        width: double.infinity,
        height: 1073*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Opacity(
          // webbackgroundLZj (205:289)
          opacity: 0.05,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xff303c6c),
            ),
            child: Stack(
              children: [
                Positioned(
                  // navigationsidebarexpandedeqK (205:290)
                  left: 0*fem,
                  top: 0*fem,
                  child: Container(
                    width: 243*fem,
                    height: 1073*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // bgXu7 (I205:290;4:83)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 242*fem,
                              height: 1073*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // navigationsidebarexpandedinact (I205:290;4:84)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(28*fem, 10*fem, 44*fem, 12*fem),
                            width: 242*fem,
                            height: 64*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // iconnavigationhamburger6aq (I205:290;4:86)
                                  margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 20*fem, 0*fem),
                                  width: 16*fem,
                                  height: 12*fem,
                                  child: Image.asset(
                                    'assets/page-2/images/icon-navigation-hamburger.png',
                                    width: 16*fem,
                                    height: 12*fem,
                                  ),
                                ),
                                Container(
                                  // image1bXb (I205:290;4:311;2:321)
                                  width: 134*fem,
                                  height: 42*fem,
                                  child: Image.asset(
                                    'assets/page-2/images/image-1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // separatordUH (I205:290;4:101)
                          left: 1.5*fem,
                          top: 75.1099853516*fem,
                          child: Align(
                            child: SizedBox(
                              width: 241*fem,
                              height: 2.38*fem,
                              child: Image.asset(
                                'assets/page-2/images/separator.png',
                                width: 241*fem,
                                height: 2.38*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // line3viH (I205:290;4:102)
                          left: 241*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 2*fem,
                              height: 1073*fem,
                              child: Image.asset(
                                'assets/page-2/images/line-3.png',
                                width: 2*fem,
                                height: 1073*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // navigationSAq (I205:290;4:103)
                          left: 0*fem,
                          top: 64*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(27*fem, 22*fem, 82*fem, 22*fem),
                            width: 242*fem,
                            height: 64*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // dashboardKEd (I205:290;4:103;4:123)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 0*fem),
                                  width: 18*fem,
                                  height: 18*fem,
                                  child: Image.asset(
                                    'assets/page-2/images/dashboard.png',
                                    width: 18*fem,
                                    height: 18*fem,
                                  ),
                                ),
                                Text(
                                  // linkqim (I205:290;4:103;4:122)
                                  'DASHBOARD',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4285714286*ffem/fem,
                                    color: Color(0xff303c6c),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // navigationypy (I205:290;4:104)
                          left: 0*fem,
                          top: 128*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(25.44*fem, 21.44*fem, 106*fem, 21.44*fem),
                            width: 242*fem,
                            height: 64*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // jobsTk9 (I205:290;4:104;4:123)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17.44*fem, 0*fem),
                                  width: 21.12*fem,
                                  height: 21.12*fem,
                                  child: Image.asset(
                                    'assets/page-2/images/jobs.png',
                                    width: 21.12*fem,
                                    height: 21.12*fem,
                                  ),
                                ),
                                Container(
                                  // linkBw3 (I205:290;4:104;4:122)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                  child: Text(
                                    'POST JOB',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4285714286*ffem/fem,
                                      color: Color(0xff303c6c),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // navigationUfF (I205:290;4:105)
                          left: 0*fem,
                          top: 192*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(24.48*fem, 14*fem, 15*fem, 16*fem),
                            width: 242*fem,
                            height: 64*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // internship8jo (I205:290;4:105;4:123)
                                  margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 16.09*fem, 0*fem),
                                  width: 23.43*fem,
                                  height: 24*fem,
                                  child: Image.asset(
                                    'assets/page-2/images/internship.png',
                                    width: 23.43*fem,
                                    height: 24*fem,
                                  ),
                                ),
                                Container(
                                  // autogroupu9pz2KP (XvtM8DSaBbMEVQpQusU9pZ)
                                  padding: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 6*fem),
                                  width: 163*fem,
                                  height: double.infinity,
                                  child: Text(
                                    'POST INTERNSHIP',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4285714286*ffem/fem,
                                      color: Color(0xff303c6c),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // navigation7Lq (I205:290;4:106)
                          left: 0*fem,
                          top: 256*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(26*fem, 22*fem, 80*fem, 22*fem),
                            width: 242*fem,
                            height: 64*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // application2To (I205:290;4:106;4:123)
                                  margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 18*fem, 0*fem),
                                  width: 20*fem,
                                  height: 19*fem,
                                  child: Image.asset(
                                    'assets/page-2/images/application.png',
                                    width: 20*fem,
                                    height: 19*fem,
                                  ),
                                ),
                                Text(
                                  // linkxcM (I205:290;4:106;4:122)
                                  'APPLICATION',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4285714286*ffem/fem,
                                    color: Color(0xff303c6c),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // image6iLd (205:336)
                          left: 61*fem,
                          top: 14*fem,
                          child: Align(
                            child: SizedBox(
                              width: 180*fem,
                              height: 60*fem,
                              child: Image.asset(
                                'assets/page-2/images/image-6.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // navigationtopheaderpPf (205:291)
                  left: 243*fem,
                  top: 0*fem,
                  child: Container(
                    width: 1197*fem,
                    height: 65*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // fillsshadowroundiV3 (I205:291;4:555)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(32*fem, 6*fem, 16*fem, 6*fem),
                            width: 1197*fem,
                            height: 64*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // pagetitleoWV (I205:291;4:566)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 713*fem, 0*fem),
                                  child: Text(
                                    'Dashboard',
                                    style: SafeGoogleFont (
                                      'Rubik',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3333333333*ffem/fem,
                                      color: Color(0xff303c6c),
                                    ),
                                  ),
                                ),
                                Container(
                                  // group33122XhP (I205:291;8:419)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9.61*fem),
                                  height: 42.39*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        // searchen1 (I205:291;4:558)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 48*fem, 4.39*fem),
                                        padding: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                        width: 202*fem,
                                        height: 24*fem,
                                        child: Container(
                                          // group454PDo (I205:291;4:559)
                                          padding: EdgeInsets.fromLTRB(4.94*fem, 3*fem, 0*fem, 3*fem),
                                          width: double.infinity,
                                          height: 24*fem,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // iconsearch8BP (I205:291;4:561)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 0*fem),
                                                width: 15.06*fem,
                                                height: 16*fem,
                                                child: Image.asset(
                                                  'assets/page-2/images/icon-search.png',
                                                  width: 15.06*fem,
                                                  height: 16*fem,
                                                ),
                                              ),
                                              Text(
                                                // searchfortaskandEVK (I205:291;4:560)
                                                'Search for Jobs and etc.',
                                                style: SafeGoogleFont (
                                                  'Rubik',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.2857142857*ffem/fem,
                                                  color: Color(0xff778ca2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // group33121B9f (I205:291;8:373)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0.39*fem),
                                        width: 43*fem,
                                        height: double.infinity,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle223v7F (I205:291;8:374)
                                              left: 0*fem,
                                              top: 10*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 32*fem,
                                                  height: 32*fem,
                                                  child: Container(
                                                    decoration: BoxDecoration (
                                                      borderRadius: BorderRadius.circular(4*fem),
                                                      border: Border.all(color: Color(0xffe3e3e3)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // notificationQHK (I205:291;8:375)
                                              left: 10*fem,
                                              top: 20*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 12*fem,
                                                  height: 12.67*fem,
                                                  child: Image.asset(
                                                    'assets/page-2/images/notification.png',
                                                    width: 12*fem,
                                                    height: 12.67*fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // frame1iJ1 (I205:291;8:376)
                                              left: 22*fem,
                                              top: 0*fem,
                                              child: Container(
                                                width: 21*fem,
                                                height: 20*fem,
                                                decoration: BoxDecoration (
                                                  color: Color(0xfffa976c),
                                                  borderRadius: BorderRadius.circular(4*fem),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '2',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.4285714286*ffem/fem,
                                                      color: Color(0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // avataryDw (I205:291;7:1377)
                                        margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 0*fem),
                                        width: 32*fem,
                                        child: Center(
                                          // imghQq (I205:291;7:1378)
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: 32*fem,
                                            child: Container(
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(16*fem),
                                                border: Border.all(color: Color(0xffd2fdff)),
                                                image: DecorationImage (
                                                  image: AssetImage (
                                                    'assets/page-2/images/img-bg.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // lineAJR (I205:291;4:567)
                          left: 0*fem,
                          top: 63*fem,
                          child: Align(
                            child: SizedBox(
                              width: 1197*fem,
                              height: 2*fem,
                              child: Image.asset(
                                'assets/page-2/images/line.png',
                                width: 1197*fem,
                                height: 2*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // cardFam (205:292)
                  left: 563*fem,
                  top: 331*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 20*fem, 17*fem),
                    width: 272*fem,
                    height: 153*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(4*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // jobpostsMNu (I205:292;4:636)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Total Application',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25*ffem/fem,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupn181fPb (XvtN1wTPQZQ9wnqXCmN181)
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // CPX (I205:292;4:637)
                                margin: EdgeInsets.fromLTRB(0*fem, 6*fem, 75*fem, 0*fem),
                                child: Text(
                                  '4,561',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 28*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0714285714*ffem/fem,
                                    letterSpacing: 0.4072727394*fem,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Container(
                                // graph282H (I205:292;4:730)
                                width: 86*fem,
                                height: 68*fem,
                                child: Image.asset(
                                  'assets/page-2/images/graph-2.png',
                                  width: 86*fem,
                                  height: 68*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          // U69 (I205:292;4:638)
                          '-4.4%',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3*ffem/fem,
                            letterSpacing: -0.3200000048*fem,
                            color: Color(0xffdc1500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // card1rm (205:293)
                  left: 851*fem,
                  top: 331*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 18*fem, 17*fem),
                    width: 272*fem,
                    height: 153*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(4*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupzsz1hzV (XvtNGS3EnQSwBdKHqSZSz1)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // jobpostsr6h (I205:293;4:636)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                child: Text(
                                  'No of Meetings',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25*ffem/fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                // ZWu (I205:293;4:637)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
                                child: Text(
                                  '125',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 28*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0714285714*ffem/fem,
                                    letterSpacing: 0.4072727394*fem,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Text(
                                // sGh (I205:293;4:638)
                                '+1.5%',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3*ffem/fem,
                                  letterSpacing: -0.3200000048*fem,
                                  color: Color(0xfffa976c),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // graph3DbT (I205:293;4:730)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                          width: 90*fem,
                          height: 81*fem,
                          child: Image.asset(
                            'assets/page-2/images/graph-3.png',
                            width: 90*fem,
                            height: 81*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // cardMSm (205:294)
                  left: 1139*fem,
                  top: 331*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 20*fem, 17*fem),
                    width: 272*fem,
                    height: 153*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(4*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // jobpostsSUD (I205:294;4:636)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'No of Hirings',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25*ffem/fem,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupcwdbY1T (XvtNW1Ux3CjCtvPyK8cWDB)
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // 1vd (I205:294;4:637)
                                margin: EdgeInsets.fromLTRB(0*fem, 6*fem, 70*fem, 0*fem),
                                child: Text(
                                  '2,456',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 28*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0714285714*ffem/fem,
                                    letterSpacing: 0.4072727394*fem,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Container(
                                // graph6YvZ (I205:294;4:730)
                                width: 86*fem,
                                height: 68*fem,
                                child: Image.asset(
                                  'assets/page-2/images/graph-6.png',
                                  width: 86*fem,
                                  height: 68*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          // hHf (I205:294;4:638)
                          '+4.5%',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3*ffem/fem,
                            letterSpacing: -0.3200000048*fem,
                            color: Color(0xff6fcf97),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // cardeCu (205:295)
                  left: 275*fem,
                  top: 331*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 17*fem),
                    width: 272*fem,
                    height: 153*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(4*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroup2pgyK49 (XvtNhFfDM9nMzf1Wwb2PGy)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 66*fem, 0*fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // jobpostsTRF (I205:295;4:636)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                child: Text(
                                  'Job Posts',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25*ffem/fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                // A4m (I205:295;4:637)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
                                child: Text(
                                  '2,456',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 28*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0714285714*ffem/fem,
                                    letterSpacing: 0.4072727394*fem,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Text(
                                // 3uF (I205:295;4:638)
                                '+2.5%',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3*ffem/fem,
                                  letterSpacing: -0.3200000048*fem,
                                  color: Color(0xff6fcf97),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // graphnbw (I205:295;4:730)
                          width: 94*fem,
                          height: 92*fem,
                          child: Image.asset(
                            'assets/page-2/images/graph.png',
                            width: 94*fem,
                            height: 92*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // piechart7eD (205:297)
                  left: 274*fem,
                  top: 500*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 16*fem),
                    width: 480*fem,
                    height: 485*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(4*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group2383DSM (205:331)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 60*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // applicationresponceAMb (205:332)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 101*fem, 0*fem),
                                child: Text(
                                  'Application Responce',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3*ffem/fem,
                                    letterSpacing: -0.3200000048*fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                // downloadreportrkD (205:333)
                                margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Download Report',
                                  textAlign: TextAlign.right,
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xfffa976c),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group2386aw7 (205:315)
                          margin: EdgeInsets.fromLTRB(34*fem, 0*fem, 32.87*fem, 48*fem),
                          width: double.infinity,
                          height: 244*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // piechartj3K (205:316)
                                left: 69.8153076172*fem,
                                top: 2*fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(55.85*fem, 133*fem, 8.98*fem, 25*fem),
                                  width: 241.36*fem,
                                  height: 242*fem,
                                  decoration: BoxDecoration (
                                    image: DecorationImage (
                                      fit: BoxFit.cover,
                                      image: AssetImage (
                                        'assets/page-2/images/ellipse-1.png',
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // dotYFf (205:320)
                                        margin: EdgeInsets.fromLTRB(158.58*fem, 0*fem, 0*fem, 48*fem),
                                        width: 17.95*fem,
                                        height: 18*fem,
                                        child: Image.asset(
                                          'assets/page-2/images/dot-T81.png',
                                          width: 17.95*fem,
                                          height: 18*fem,
                                        ),
                                      ),
                                      Container(
                                        // dotf5P (205:321)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 158.58*fem, 0*fem),
                                        width: 17.95*fem,
                                        height: 18*fem,
                                        child: Image.asset(
                                          'assets/page-2/images/dot.png',
                                          width: 17.95*fem,
                                          height: 18*fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                // runninglineCLD (205:322)
                                left: 0*fem,
                                top: 0*fem,
                                child: Container(
                                  width: 95.75*fem,
                                  height: 96*fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // wHo (205:323)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                        child: Text(
                                          '+2,5%',
                                          style: SafeGoogleFont (
                                            'Poppins',
                                            fontSize: 18*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5*ffem/fem,
                                            color: Color(0xff464155),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // lineexu (205:324)
                                        margin: EdgeInsets.fromLTRB(25.93*fem, 0*fem, 0*fem, 0*fem),
                                        width: 69.82*fem,
                                        height: 58*fem,
                                        child: Image.asset(
                                          'assets/page-2/images/line-GF7.png',
                                          width: 69.82*fem,
                                          height: 58*fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                // fixedlinearZ (205:325)
                                left: 304.1953125*fem,
                                top: 59*fem,
                                child: Container(
                                  width: 76.93*fem,
                                  height: 78.5*fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // VyX (205:326)
                                        margin: EdgeInsets.fromLTRB(24.93*fem, 0*fem, 0*fem, 11*fem),
                                        child: Text(
                                          '-0,5%',
                                          style: SafeGoogleFont (
                                            'Poppins',
                                            fontSize: 18*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5*ffem/fem,
                                            color: Color(0xff464155),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // linePZ7 (205:327)
                                        width: 50.87*fem,
                                        height: 40.5*fem,
                                        child: Image.asset(
                                          'assets/page-2/images/line-aqs.png',
                                          width: 50.87*fem,
                                          height: 40.5*fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                // downlineKhf (205:328)
                                left: 7.9788818359*fem,
                                top: 166*fem,
                                child: Container(
                                  width: 179.03*fem,
                                  height: 70*fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // Epd (205:329)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                        child: Text(
                                          '+0,4%',
                                          style: SafeGoogleFont (
                                            'Poppins',
                                            fontSize: 18*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5*ffem/fem,
                                            color: Color(0xff464155),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // linen5T (205:330)
                                        margin: EdgeInsets.fromLTRB(33.41*fem, 0*fem, 0*fem, 0*fem),
                                        width: 145.61*fem,
                                        height: 32*fem,
                                        child: Image.asset(
                                          'assets/page-2/images/line-9zu.png',
                                          width: 145.61*fem,
                                          height: 32*fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group2382JJh (205:299)
                          margin: EdgeInsets.fromLTRB(29*fem, 0*fem, 28*fem, 0*fem),
                          width: double.infinity,
                          height: 75*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group2381DgZ (205:300)
                                width: 84*fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // labellegendlightmxy (205:301)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // rectangle10vL5 (205:302)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                            width: 12*fem,
                                            height: 12*fem,
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(4*fem),
                                              color: Color(0xff303c6c),
                                            ),
                                          ),
                                          Text(
                                            // webservera2tu (205:303)
                                            'Shortlisted',
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff464155),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      // Bmo (205:304)
                                      '942',
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 32*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xff464155),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 84*fem,
                              ),
                              Container(
                                // group2379vzH (205:305)
                                width: 52*fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // labellegendlight685 (205:307)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // rectangle10zjF (205:308)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                            width: 12*fem,
                                            height: 12*fem,
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(4*fem),
                                              color: Color(0xfffa976c),
                                            ),
                                          ),
                                          Text(
                                            // webserveraXz5 (205:309)
                                            'Hired',
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff464155),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      // U8d (205:306)
                                      '25',
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 32*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xff464155),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 84*fem,
                              ),
                              Container(
                                // group2380oRo (205:310)
                                width: 87*fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // labellegendlightZQy (205:312)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 9*fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // rectangle105PK (205:313)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                            width: 12*fem,
                                            height: 12*fem,
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(4*fem),
                                              color: Color(0xffb4dfe5),
                                            ),
                                          ),
                                          Text(
                                            // webserveraDkR (205:314)
                                            'Rejected',
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff464155),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      // yUh (205:311)
                                      '2,452',
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 32*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xff464155),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // component1iSH (6:586)
                  left: 770*fem,
                  top: 500*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 25*fem),
                    width: 638*fem,
                    height: 485*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(4*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group2384RLh (6:386)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                          width: double.infinity,
                          height: 48*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(30*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // recentjobpostsjsB (6:232)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 144*fem, 0*fem),
                                child: Text(
                                  'Recent Job Posts',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3*ffem/fem,
                                    letterSpacing: -0.3200000048*fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                // tabmenuBUH (4:992)
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xfff4f5f8),
                                  borderRadius: BorderRadius.circular(30*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroup2bvm88d (XvtPdyb2ndyrou4NU52bvm)
                                      padding: EdgeInsets.fromLTRB(33*fem, 14*fem, 23*fem, 14*fem),
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // monthlyFU9 (4:997)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 0*fem),
                                            child: Text(
                                              'Monthly',
                                              style: SafeGoogleFont (
                                                'Montserrat',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.4285714286*ffem/fem,
                                                color: Color(0xff969ba0),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // weeklyisX (4:998)
                                            'Weekly',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.4285714286*ffem/fem,
                                              color: Color(0xff969ba0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // activeemB (4:994)
                                      width: 94*fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        color: Color(0xff303c6c),
                                        borderRadius: BorderRadius.circular(30*fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Today',
                                          style: SafeGoogleFont (
                                            'Montserrat',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.4285714286*ffem/fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group2385AUd (6:433)
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group7KMX (6:378)
                                padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 36*fem, 8*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffedf4fb),
                                  borderRadius: BorderRadius.circular(4*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // jobtitleyws (6:380)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 92*fem, 0*fem),
                                      child: Text(
                                        'Job Title',
                                        style: SafeGoogleFont (
                                          'Montserrat',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.6666666667*ffem/fem,
                                          color: Color(0xff0c1e5b),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // categoryWS1 (6:381)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 47*fem, 0*fem),
                                      child: Text(
                                        'Category',
                                        style: SafeGoogleFont (
                                          'Montserrat',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.6666666667*ffem/fem,
                                          color: Color(0xff0c1e5b),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // openingsQnH (6:382)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 35*fem, 0*fem),
                                      child: Text(
                                        'Openings',
                                        style: SafeGoogleFont (
                                          'Montserrat',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.6666666667*ffem/fem,
                                          color: Color(0xff0c1e5b),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // applicationsXc1 (6:387)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 101*fem, 0*fem),
                                      child: Text(
                                        'Applications',
                                        style: SafeGoogleFont (
                                          'Montserrat',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.6666666667*ffem/fem,
                                          color: Color(0xff0c1e5b),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // statusqMo (6:388)
                                      'Status',
                                      style: SafeGoogleFont (
                                        'Montserrat',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.6666666667*ffem/fem,
                                        color: Color(0xff0c1e5b),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // row03BwT (6:585)
                                padding: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0x0cd2d2d2),
                                  borderRadius: BorderRadius.circular(1*fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroup5xhwWD3 (XvtQ5dWxByU7Z4Crof5Xhw)
                                      margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 12.5*fem, 16*fem),
                                      width: double.infinity,
                                      height: 36*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogrouppegmScV (XvtQDnx1zwm1hWqqGypeGm)
                                            padding: EdgeInsets.fromLTRB(0*fem, 9*fem, 99.5*fem, 9*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // uiuxdesigneraTo (I6:585;6:264)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                                                  child: Text(
                                                    'UI UX Designer',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // fulltimeTXb (I6:585;6:265)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 60*fem, 0*fem),
                                                  child: Text(
                                                    'Full Time',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // ByP (I6:585;6:271)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 92*fem, 0*fem),
                                                  child: Text(
                                                    '12',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  // u8h (I6:585;6:272)
                                                  '135',
                                                  style: SafeGoogleFont (
                                                    'Montserrat',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2857142857*ffem/fem,
                                                    color: Color(0xff666666),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // badgetextsuccesslightd4h (I6:585;6:551)
                                            width: 86*fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: Color(0xff6fcf97),
                                              borderRadius: BorderRadius.circular(4*fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Active',
                                                style: SafeGoogleFont (
                                                  'Montserrat',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.4285714286*ffem/fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // borderbotjNd (I6:585;6:253)
                                      width: double.infinity,
                                      height: 1*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(1*fem),
                                        color: Color(0xffd2d2d2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // row034A1 (6:393)
                                padding: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0x0cd2d2d2),
                                  borderRadius: BorderRadius.circular(1*fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupnnxpjX3 (XvtQe2kdaUnfMevGvKNnXP)
                                      margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 12.5*fem, 16*fem),
                                      width: double.infinity,
                                      height: 36*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogroupb6hbfvV (XvtQnrqFf812FR7rmzb6HB)
                                            padding: EdgeInsets.fromLTRB(0*fem, 9*fem, 96.5*fem, 9*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // uiuxdesignerQt5 (I6:393;6:264)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44*fem, 0*fem),
                                                  child: Text(
                                                    'Full Stack Dev',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // fulltimekS9 (I6:393;6:265)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 60*fem, 0*fem),
                                                  child: Text(
                                                    'Full Time',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // fp1 (I6:393;6:271)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 87*fem, 0*fem),
                                                  child: Text(
                                                    '08',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  // cUM (I6:393;6:272)
                                                  '100',
                                                  style: SafeGoogleFont (
                                                    'Montserrat',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2857142857*ffem/fem,
                                                    color: Color(0xff666666),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // badgetextsuccesslightjos (I6:393;6:551)
                                            width: 86*fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: Color(0xfffa976c),
                                              borderRadius: BorderRadius.circular(4*fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Inactive',
                                                style: SafeGoogleFont (
                                                  'Montserrat',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.4285714286*ffem/fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // borderbotqM7 (I6:393;6:253)
                                      width: double.infinity,
                                      height: 1*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(1*fem),
                                        color: Color(0xffd2d2d2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // row03zUu (6:403)
                                padding: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0x0cd2d2d2),
                                  borderRadius: BorderRadius.circular(1*fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupesvtvdT (XvtRCWpWFSitkfaWxXESVT)
                                      margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 12.5*fem, 16*fem),
                                      width: double.infinity,
                                      height: 36*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogroupdaazU9B (XvtRLBGQMfKhLeYXtadAAZ)
                                            padding: EdgeInsets.fromLTRB(0*fem, 9*fem, 102.5*fem, 9*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // uiuxdesigner1eu (I6:403;6:264)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 88*fem, 0*fem),
                                                  child: Text(
                                                    'DevOps',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // fulltimevQV (I6:403;6:265)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 52*fem, 0*fem),
                                                  child: Text(
                                                    'Internship',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // FxZ (I6:403;6:271)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 92*fem, 0*fem),
                                                  child: Text(
                                                    '12',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  // ajw (I6:403;6:272)
                                                  '05',
                                                  style: SafeGoogleFont (
                                                    'Montserrat',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2857142857*ffem/fem,
                                                    color: Color(0xff666666),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // badgetextsuccesslightYAy (I6:403;6:551)
                                            width: 86*fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: Color(0xff6fcf97),
                                              borderRadius: BorderRadius.circular(4*fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Active',
                                                style: SafeGoogleFont (
                                                  'Montserrat',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.4285714286*ffem/fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // borderbot2bw (I6:403;6:253)
                                      width: double.infinity,
                                      height: 1*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(1*fem),
                                        color: Color(0xffd2d2d2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // row03PSV (6:413)
                                padding: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0x0cd2d2d2),
                                  borderRadius: BorderRadius.circular(1*fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogrouprkxzJJZ (XvtRhv9BRRtsCQGBqbRKxZ)
                                      margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 12.5*fem, 16*fem),
                                      width: double.infinity,
                                      height: 36*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogroupddimdrd (XvtRrkDoW57E6ATmhGddiM)
                                            padding: EdgeInsets.fromLTRB(0*fem, 9*fem, 102.5*fem, 9*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // uiuxdesignerj8y (I6:413;6:264)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 56*fem, 0*fem),
                                                  child: Text(
                                                    'Android Dev',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // fulltime1sB (I6:413;6:265)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 60*fem, 0*fem),
                                                  child: Text(
                                                    'Full Time',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // WJ9 (I6:413;6:271)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 87*fem, 0*fem),
                                                  child: Text(
                                                    '04',
                                                    style: SafeGoogleFont (
                                                      'Montserrat',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2857142857*ffem/fem,
                                                      color: Color(0xff666666),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  // QeR (I6:413;6:272)
                                                  '45',
                                                  style: SafeGoogleFont (
                                                    'Montserrat',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2857142857*ffem/fem,
                                                    color: Color(0xff666666),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // badgetextsuccesslighta37 (I6:413;6:551)
                                            width: 86*fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: Color(0xff6fcf97),
                                              borderRadius: BorderRadius.circular(4*fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Active',
                                                style: SafeGoogleFont (
                                                  'Montserrat',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.4285714286*ffem/fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // borderbot4iy (I6:413;6:253)
                                      width: double.infinity,
                                      height: 1*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(1*fem),
                                        color: Color(0xffd2d2d2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // row03dGH (6:423)
                                padding: EdgeInsets.fromLTRB(12*fem, 15*fem, 12.5*fem, 17*fem),
                                width: double.infinity,
                                height: 68*fem,
                                decoration: BoxDecoration (
                                  color: Color(0x0cd2d2d2),
                                  borderRadius: BorderRadius.circular(1*fem),
                                ),
                                child: Container(
                                  // autogrouptzkrLgV (XvtSHyzkV7X4sFt8R8tZkR)
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // autogroupwt21Tm7 (XvtSRymRjAabptdT3NWt21)
                                        padding: EdgeInsets.fromLTRB(0*fem, 9*fem, 102.5*fem, 9*fem),
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // uiuxdesignerbsK (I6:423;6:264)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                                              child: Text(
                                                'IOS Developer',
                                                style: SafeGoogleFont (
                                                  'Montserrat',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2857142857*ffem/fem,
                                                  color: Color(0xff666666),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // fulltime8sF (I6:423;6:265)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 60*fem, 0*fem),
                                              child: Text(
                                                'Full Time',
                                                style: SafeGoogleFont (
                                                  'Montserrat',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2857142857*ffem/fem,
                                                  color: Color(0xff666666),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // g85 (I6:423;6:271)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 92*fem, 0*fem),
                                              child: Text(
                                                '18',
                                                style: SafeGoogleFont (
                                                  'Montserrat',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2857142857*ffem/fem,
                                                  color: Color(0xff666666),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // cnR (I6:423;6:272)
                                              '96',
                                              style: SafeGoogleFont (
                                                'Montserrat',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2857142857*ffem/fem,
                                                color: Color(0xff666666),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // badgetextsuccesslightNmb (I6:423;6:551)
                                        width: 86*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          color: Color(0xfffa976c),
                                          borderRadius: BorderRadius.circular(4*fem),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Inactive',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w700,
                                              height: 1.4285714286*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // component33cq (205:334)
                  left: 274*fem,
                  top: 80*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(56*fem, 3*fem, 36.42*fem, 0.05*fem),
                    width: 1134*fem,
                    height: 235*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff303c6c),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // welcometohirekarmabishalranaX2 (I205:334;7:256)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 211*fem, 1.95*fem),
                          constraints: BoxConstraints (
                            maxWidth: 481*fem,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 40*ffem,
                                fontWeight: FontWeight.w400,
                                height: 2.475*ffem/fem,
                                color: Color(0xffffffff),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Welcome To Hire karma\n',
                                ),
                                TextSpan(
                                  text: 'John Doe',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 48*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 2.0625*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // group275bT (I205:334;6:601)
                          width: 349.58*fem,
                          height: 231.95*fem,
                          child: Image.asset(
                            'assets/page-2/images/group-27.png',
                            width: 349.58*fem,
                            height: 231.95*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // footerc5b (205:335)
                  left: 242*fem,
                  top: 1001*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(296*fem, 11*fem, 295*fem, 9*fem),
                    width: 1198*fem,
                    height: 72*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                    child: Container(
                      // group33118hcq (I205:335;7:422)
                      width: double.infinity,
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // image1GA9 (I205:335;7:407;2:321)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                            width: 170*fem,
                            height: 52*fem,
                            child: Image.asset(
                              'assets/page-2/images/image-1-TGZ.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            // allrightsreservedtohirekarmave (I205:335;7:386)
                            '© 2021 All Rights Reserved to Hire karma | Version 0.1',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
          );
  }
}
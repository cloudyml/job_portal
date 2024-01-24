import 'package:flutter/material.dart';

import '../utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // loginVpq (13:511)
        width: double.infinity,
        height: 900 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
        ),
        child: Stack(
          children: [
            Positioned(
              // malusimsomixpmgsqga8unsplash2n (13:512)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 1440 * fem,
                  height: 1083 * fem,
                  child: Image.asset(
                    'assets/storyboard/images/malusi-msomi-xpmgsqga8-unsplash-2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // image3fMw (13:513)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 1364 * fem,
                  height: 910 * fem,
                  child: Image.asset(
                    'assets/storyboard/images/image-3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // image4bFb (13:514)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 1594 * fem,
                  height: 1064 * fem,
                  child: Image.asset(
                    'assets/storyboard/images/image-4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // group125S1K (13:516)
              left: 800 * fem,
              top: 78 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    70 * fem, 20 * fem, 70 * fem, 32.44 * fem),
                width: 568 * fem,
                height: 744 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // image52ER (204:613)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 8 * fem, 18 * fem),
                      width: 420 * fem,
                      height: 146 * fem,
                      child: Image.asset(
                        'assets/storyboard/images/image-5.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // group1940kRK (13:520)
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // group33123fYH (13:543)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 48 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // loginki9 (13:544)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 16 * fem),
                                  child: Text(
                                    'Log in',
                                    style: SafeGoogleFont(
                                      'Source Sans Pro',
                                      fontSize: 52.2420883179 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2575 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // entertocontinueandexplorewithi (13:545)
                                  'Enter to continue and explore within your grasp.\n',
                                  style: SafeGoogleFont(
                                    'Source Sans Pro',
                                    fontSize: 13.9312238693 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2575 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // group33125mNM (13:524)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 57 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // emailaddresswB (13:531)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 32 * fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // emailid23P (13:532)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 15 * fem),
                                        child: Text(
                                          'Email ID',
                                          style: SafeGoogleFont(
                                            'Open Sans',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // enteryouremailidpV3 (13:533)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 16.73 * fem),
                                        child: Text(
                                          'Enter your Email ID',
                                          style: SafeGoogleFont(
                                            'Open Sans',
                                            fontSize: 20 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // password8kd (13:535)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 27 * fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // passwordsCR (13:536)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 15.38 * fem),
                                        child: Text(
                                          'Password',
                                          style: SafeGoogleFont(
                                            'Open Sans',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // autogroupc1nuPwT (XvtL3zjFConJH1hCJRC1nu)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0.48 * fem, 18.45 * fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // enteryourpasswordjVX (13:537)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  196.85 * fem,
                                                  0 * fem),
                                              child: Text(
                                                'Enter your Password',
                                                style: SafeGoogleFont(
                                                  'Open Sans',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.3625 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // eyesEhB (13:538)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0.38 * fem,
                                                  0 * fem,
                                                  0 * fem),
                                              width: 30.67 * fem,
                                              height: 24.38 * fem,
                                              child: Image.asset(
                                                'assets/storyboard/images/eyes.png',
                                                width: 30.67 * fem,
                                                height: 24.38 * fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // group1247FB (13:525)
                                  margin: EdgeInsets.fromLTRB(
                                      3 * fem, 0 * fem, 2 * fem, 0 * fem),
                                  width: double.infinity,
                                  height: 20 * fem,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group123pQV (13:527)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 166 * fem, 0 * fem),
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // iconsuggestedsquareemptyMvD (13:529)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  19 * fem,
                                                  0 * fem),
                                              width: 18 * fem,
                                              height: 18 * fem,
                                              child: Image.asset(
                                                'assets/storyboard/images/icon-suggested-square-empty.png',
                                                width: 18 * fem,
                                                height: 18 * fem,
                                              ),
                                            ),
                                            Text(
                                              // remembermeqKb (13:528)
                                              'Remember Me',
                                              style: SafeGoogleFont(
                                                'Open Sans',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.3625 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        // forgotpasswordZmP (13:526)
                                        'Forgot password?',
                                        style: SafeGoogleFont(
                                          'Open Sans',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3625 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // logingr1 (13:521)
                            width: double.infinity,
                            height: 82 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xff303c6c),
                              borderRadius: BorderRadius.circular(8 * fem),
                            ),
                            child: Center(
                              child: Text(
                                'Login to Continue',
                                style: SafeGoogleFont(
                                  'Open Sans',
                                  fontSize: 20.8968353271 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625 * ffem / fem,
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
            ),
          ],
        ),
      ),
    );
  }
}

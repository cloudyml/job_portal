import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/student_login/login.dart';
import '../routes/app_routes.dart';
import '../routes/login_state_check.dart';

final sizeBoxOf10 = SizedBox(height: 10.sp);
final horizontalSizeBoxOf10 = SizedBox(width: 10.sp);

final userRole = ''.obs;
final userID = ''.obs;
const String loggedInKey = 'LoggedIn';
final companyLogo = "images/cloudyml_logobg.png";

void saveLoginState(BuildContext context) {
  Provider.of<LoginState>(context, listen: false).loggedIn = true;
}

void saveLoginOutState(BuildContext context) {
  Provider.of<LoginState>(context, listen: false).loggedIn = false;
}

routeToDashBoards(context) {
  if (userRole.value == "student") {
    GoRouter.of(context).pushReplacement(AppRoutes.studentHome);
  } else if ((userRole.value == "HR")) {
    GoRouter.of(context).pushReplacement(AppRoutes.hrDashboard);
  }
}

List textButtonNames = [
  "Home",
  "Learn",
  "Preparations",
];

List iconsInMenu = [
  Icons.home,
  Icons.group_work,
  Icons.connect_without_contact_rounded,
];

showToast(msg) {
  Fluttertoast.showToast(msg: msg);
}

Widget topMenuBar(context, isPhone) {
  final loginController = Get.put(LoginController());
  final homeController = Get.put(HomeController());
  RxBool isHovered = false.obs;
  return Padding(
    padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
    child: Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20.sp),
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.studentHome);
            },
            child: Image.asset(
              companyLogo,
              width: 35.sp,
              height: 25.sp,
            ),
          ),
          isPhone
              ? Container()
              : Row(
                  children: List.generate(3, (index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          GoRouter.of(context)
                              .pushReplacement(AppRoutes.studentHome);

                          print("object ${GoRouter.of(context).location}");
                          print("object ${Uri.base.path}");
                        }
                      },
                      hoverColor: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: Container(
                          decoration: BoxDecoration(
                              color: GoRouter.of(context).location ==
                                          "/studentdashboard" &&
                                      index == 0
                                  ? Colors.teal
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10.sp)),
                          padding: EdgeInsets.all(10.sp),
                          child: Row(
                            children: [
                              Icon(iconsInMenu[index]),
                              SizedBox(
                                width: 3.sp,
                              ),
                              Text(textButtonNames[index]),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
          // GoRouter.of(context).location == "/userprofile"
          //     ?
          homeController.loggedIN.value
              ? InkWell(
                  onTap: () {},
                  onHover: (value) {
                    isHovered.value = value;
                  },
                  borderRadius: BorderRadius.circular(15.sp),
                  child: IconButton(
                      onPressed: () {
                        loginController.logout(context);
                        homeController.loggedIN.value = false;
                      },
                      splashRadius: 15.sp,
                      hoverColor: mainColor,
                      icon: Obx(() {
                        return Icon(
                          Icons.power_settings_new_sharp,
                          color: isHovered.value ? Colors.white : Colors.red,
                        );
                      })),
                )
              : InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.studentLogin);
                  },
                  onHover: (value) {
                    isHovered.value = value;
                  },
                  child: Obx(() {
                    return Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          color: isHovered.value ? mainColor : Colors.white,
                          borderRadius: BorderRadius.circular(10.sp)),
                      child: Text("Login/Signup",
                          style: TextStyle(
                            color: isHovered.value ? Colors.white : mainColor,
                          )),
                    );
                  }),
                )
          // : InkWell(
          //     onTap: () {
          //       GoRouter.of(context).push(AppRoutes.studentProfile);
          //     },
          //     child: Obx(() {
          //       return CircleAvatar(
          //         minRadius: 10.sp,
          //         maxRadius: 15.sp,
          //         backgroundImage: CachedNetworkImageProvider(
          //             homeController.profile_picture.value),
          //       );
          //     }),
          //   ),
        ],
      );
    }),
  );
}

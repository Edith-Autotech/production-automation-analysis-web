import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_automation_web/helper/user_roles_enum.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/responsive.dart';

import '../custom_text.dart';

AppBar topNavigationBar(
  BuildContext context,
  GlobalKey<ScaffoldState> scaffoldKey,
) {
  return AppBar(
    leading: ResponsiveWidget.isSmallScreen(context)
        ? IconButton(
            onPressed: () {
              if (!scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.openDrawer();
              }
            },
            icon: Icon(
              Icons.menu,
              color: dark,
            ),
          )
        : Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Icon(
                  Icons.ac_unit,
                  color: dark.withOpacity(.7),
                ),
              )
            ],
          ),
    title: Row(
      children: [
        Visibility(
          child: CustomText(
            text: "Paa Web",
            color: lightGrey,
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        Expanded(child: Container()),
        SizedBox(width: defaultPadding),
        Obx(
          () => CustomText(
            text: userController.activeUser.value.name,
            color: lightGrey,
          ),
        ),
        SizedBox(width: defaultPadding),
        Container(
          width: 1,
          height: 22,
          color: lightGrey,
        ),
        SizedBox(width: defaultPadding),
        Container(
          decoration: BoxDecoration(
            color: returnColorFromEnum(
              userController.activeUser.value.role,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: light,
              child: Icon(
                Icons.person_outline,
                color: dark,
              ),
            ),
          ),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

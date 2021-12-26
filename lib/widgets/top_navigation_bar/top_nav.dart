import 'package:flutter/material.dart';
import 'package:production_automation_web/constants/style.dart';
import 'package:production_automation_web/helper/responsive.dart';

import '../custom_text.dart';

AppBar topNavigationBar(BuildContext context) {
  return AppBar(
    leading: ResponsiveWidget.isSmallScreen(context)
        ? IconButton(
            onPressed: () {},
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
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: dark.withOpacity(.7),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                height: 12,
                width: 12,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: active,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: light, width: 2),
                ),
              ),
            )
          ],
        ),
        Container(
          width: 1,
          height: 22,
          color: lightGrey,
        ),
        const SizedBox(width: 24),
        CustomText(
          text: "Omkar Tralsawala",
          color: lightGrey,
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
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

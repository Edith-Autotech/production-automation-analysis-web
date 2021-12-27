import 'package:flutter/material.dart';

import '/helper/responsive.dart';
import '/constants/controllers.dart';

import '../base_page_layout.dart';

import '/pages/dashboard/widgets/header/header.dart';

import 'widgets/state_cards/state_cards_large_screen.dart';
import 'widgets/state_cards/state_cards_small_screen.dart';

import '/widgets/custom_text.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    countController.fetchCount();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      children: [
        const Header(),
        // ! Header section with date selector and machine name
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
                    const StateCardsLargeScreen()
                  else
                    const StateCardsSmallScreen(),
                  // ! charts section for mobile view
                  if (ResponsiveWidget.isSmallScreen(context)) const SizedBox(height: 10),
                  if (ResponsiveWidget.isSmallScreen(context))
                    const Center(
                      child: CustomText(text: "show Charts here"),
                    )
                ],
              ),
            ),
            if (!ResponsiveWidget.isSmallScreen(context)) const SizedBox(width: 10),
            if (!ResponsiveWidget.isSmallScreen(context))
              const Expanded(
                flex: 2,
                child: Center(
                  child: CustomText(text: "show Charts here"),
                ),
              )
          ],
        ),
      ],
    );
  }
}

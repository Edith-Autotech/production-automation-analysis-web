import 'package:flutter/material.dart';
import 'package:production_automation_web/helper/responsive.dart';
import 'package:production_automation_web/widgets/side_menu/side_menu.dart';
import 'package:production_automation_web/widgets/top_navigation_bar/top_nav.dart';

import 'widgets/screens/large_screen.dart';
import 'widgets/screens/small_scren.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}

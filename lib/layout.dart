import 'package:flutter/material.dart';

import '/helper/responsive.dart';

import '/widgets/side_menu/side_menu.dart';
import '/widgets/top_navigation_bar/top_nav.dart';

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
      appBar: topNavigationBar(
        context,
        scaffoldKey,
      ),
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

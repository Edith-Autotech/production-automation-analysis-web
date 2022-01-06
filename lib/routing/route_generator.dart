import 'package:flutter/material.dart';

import '/views/dashboard/dashboard.dart';
import '/views/machines/machines.dart';
import '/views/overview/overview.dart';
import '/views/parts/parts.dart';
import '/views/profile/profile.dart';
import '/views/settings/settings.dart';
import '/routing/routes.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageDisplayName:
      return _getPageRoute(const OverviewPage());
    case machinesPageDisplayName:
      return _getPageRoute(const MachinesPage());
    case dashboardPageDisplayName:
      return _getPageRoute(const DashboardPage());
    case partsPageDisplayName:
      return _getPageRoute(const PartsPage());
    case profilePageDisplayName:
      return _getPageRoute(const ProfilePage());
    case settingsPageDisplayName:
      return _getPageRoute(const SettingsPage());
    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) => MaterialPageRoute(builder: (_) => child);

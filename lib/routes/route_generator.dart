import 'package:flutter/material.dart';
import 'package:production_automation_web/views/machine_details/machine_details_page.dart';
import 'package:production_automation_web/views/machines/machines_page.dart';
import 'package:production_automation_web/views/selected_part/selected_part_page.dart';

import '/routes/routes.dart';
import '/views/profile/profile.dart';
import '/views/settings/settings.dart';
import '../views/overview/overview_page.dart';
import '../views/parts/parts_page.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageDisplayName:
      return _getPageRoute(const OverviewPage());
    case machinesPageDisplayName:
      return _getPageRoute(const MachinesPage());
    case dashboardPageDisplayName:
      return _getPageRoute(const MachineDetailsPage());
    case partsPageDisplayName:
      return _getPageRoute(const PartsPage());
    case partDetailsDisplayName:
      return _getPageRoute(const SelectedPartPage());
    case profilePageDisplayName:
      return _getPageRoute(const ProfilePage());
    case settingsPageDisplayName:
      return _getPageRoute(const SettingsPage());
    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) => MaterialPageRoute(builder: (_) => child);

import 'package:flutter/material.dart';

import '/pages/authentication/authentication.dart';
import '/pages/machines/machines.dart';
import '/pages/overview/overview.dart';
import '/pages/parts/parts.dart';
import '/pages/profile/profile.dart';
import '/pages/settings/settings.dart';
import '/routing/routes.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageDisplayName:
      return _getPageRoute(const OverviewPage());
    case machinesPageDisplayName:
      return _getPageRoute(const MachinesPage());
    case partsPageDisplayName:
      return _getPageRoute(const PartsPage());
    case profilePageDisplayName:
      return _getPageRoute(const ProfilePage());
    case settingsPageDisplayName:
      return _getPageRoute(const SettingsPage());
    case authenticationPageDisplayName:
      return _getPageRoute(const AuthenticationPage());
    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) => MaterialPageRoute(builder: (_) => child);

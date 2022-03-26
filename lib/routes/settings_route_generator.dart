import 'package:flutter/material.dart';

import '/views/settings/components/settinngs_reasons/settings_reasons.dart';
import '/views/settings/components/settings_factory_details/settings_factory_details.dart';
import '/views/settings/components/settings_add_user/settings_add_user.dart';
import '/views/settings/components/settings_user/settings_user.dart';

import '/routes/settings_routes.dart';

Route<dynamic> generateSettingsRoute(RouteSettings settings) {
  switch (settings.name) {
    case settingsUsersDisplayName:
      return _getSettingsPageRoute(const SettingsUser());
    case settingsAddNewUserDisplayName:
      return _getSettingsPageRoute(const SettingsAddUser());
    case settingsFactoryDetailsDisplayName:
      return _getSettingsPageRoute(const SettingsFactoryDetails());
    case settingsReasonsListDisplayName:
      return _getSettingsPageRoute(const SettingsReasons());
    default:
      return _getSettingsPageRoute(const SettingsUser());
  }
}

PageRoute _getSettingsPageRoute(Widget child) => MaterialPageRoute(builder: (_) => child);

import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/routing/settings_route_generator.dart';
import '/routing/settings_routes.dart';

Navigator settingsNavigator() => Navigator(
      key: settingsNavigationController.settingsNavKey,
      initialRoute: settingsUsersRouteName,
      onGenerateRoute: generateSettingsRoute,
    );

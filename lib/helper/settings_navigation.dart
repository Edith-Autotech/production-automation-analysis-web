import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/routes/settings_route_generator.dart';
import '/routes/settings_routes.dart';

Navigator settingsNavigator() => Navigator(
      key: settingsNavigationController.settingsNavKey,
      initialRoute: settingsUsersRouteName,
      onGenerateRoute: generateSettingsRoute,
    );

import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/routing/route_generator.dart';
import '/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navKey,
      initialRoute: overViewPageRouteName,
      onGenerateRoute: generateRoutes,
    );

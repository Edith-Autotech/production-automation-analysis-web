import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/routes/route_generator.dart';
import '/routes/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navKey,
      initialRoute: overViewPageRouteName,
      onGenerateRoute: generateRoutes,
    );

import 'package:flutter/material.dart';
import '/src/screens/dashboard/dashboard.dart';
import '/src/screens/landing_screens/landing_screen_auth.dart';
import '/src/screens/machines/machines_screen.dart';
import '/src/screens/parts/parts_screen.dart';
import '/src/screens/profile/profile_screen.dart';
import '/src/screens/settings/settings_screen.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeMachine:
        final args = settings.arguments as DashboardArgs;
        return MaterialPageRoute(
          builder: (_) => Dashboard(
            machine: args.machine,
            token: args.token,
          ),
        );
      case routeMachines:
        final args = settings.arguments as MachinesScreenArguments;
        return MaterialPageRoute(
          builder: (_) => MachinesScreen(
            token: args.token,
          ),
        );
      case routeParts:
        return MaterialPageRoute(
          builder: (_) => const PartsScreen(),
        );
      case routeSettings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case routeProfile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case routeAuthLanding:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}

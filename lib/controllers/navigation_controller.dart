import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navKey.currentState!.pushNamed(routeName);
  }

  goBack() => navKey.currentState!.pop();
}

class SettingsNavigationController extends GetxController {
  static SettingsNavigationController instance = Get.find();
  final GlobalKey<NavigatorState> settingsNavKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return settingsNavKey.currentState!.pushNamed(routeName);
  }

  goBack() => settingsNavKey.currentState!.pop();
}

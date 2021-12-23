import 'package:flutter/material.dart';

class Constants {
  static const primaryColor = Color(0xFF2697FF);
  static const secondaryColor = Color(0xFF2A2D3E);
  static const bgColor = Color(0xFF212332);

  static const defaultPadding = 16.0;
  // ? UI Constants
  static const String name = "Name";
  static const String count = "Count";
  static const String appName = "Production Automation";
  static const String reasonCode = "Reason Code";
  static const String previousState = "Previous State";
  static const String reasonScreen = "Reason Screen";
  static const String machines = "Machines";
  static const String operation = "Operation";
  static const String parts = "Parts";
  static const String currentPart1 = "Current part 1";
  static const String currentPart2 = "Current part 2";
  static const String currentOperation1 = "Current operation 1";
  static const String currentOperation2 = "Current operation 2";
  static const String edit = "Edit";
  static const String parallelState = "Parallel state";
  static const String resumeProduction = "Resume Production?";
  static const String partNumber = "Part Number";
  static const String searchPartNumber = "Search by part number";
  static const String operationNumber = "Operation Number";
  static const String logout = "Logout";
  static const String deviceRegistered = "Device Registered";
  static const String updatePart = "Update part";
  static const String na = "NA";
  static String operationNumberValue(int index) => "Operation  ${index + 1}";

  //  ? Route Constants
  static const String signInRoute = "/sign-in-screen";
  static const String homeRoute = "/home-screen";
  static const String factoryLandingRoute = "/factory-landing-screen";
  static const String operationRoute = "/operation-screen";
  static const String partsRoute = "/parts-screen";
  static const String partRoute = "/part-screen";

// ? Error Constants
  static const String selectPartFirst = "Select a Part first";
  static const String cannotChangePartWhenInStandby = "Cannot change part when machine is in standby mode";
  static const String cannotChangeOperationWhenInStandby = "Cannot change operation when machine is in standby mode";

  // ? Config Constants
  static const String configUrl = "https://production-auto-analysis.herokuapp.com/graphql";
  static const String production = "production";
  static const String standby = "standby";
  static const String idle = "idle";

  // ? User interaction Constants
  static const String yes = "Yes";
  static const String no = "No";
  static const String cancel = "Cancel";
  static const String contactEA = "Contact Edith-Autotech to add factory";
  static const String confirmLogout = "Are you sure about logging out?";
  static const String confirmStandby = "Are you certain you want to put the machine in a forced standby state";
  static const String assignMachineName = "Assign a name to this device!";

  // ? Font sizes
  static const double appBarFontSize = 18;
  static const double headingFontSize = 24;
  static const double subHeadingFontSize = 16;
  static const double buttonFontSize = 17;
}

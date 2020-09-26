import 'dart:core';

class ApiPath {
  static String imageAssetPath({String imageName}) =>
      'assets/images/$imageName';

  static String factoryPath({String uid, String key}) =>
      'user/$uid/Factories/$key';

  static String count({String key, String machineID, String date}) =>
      "factories/$key/machines/$machineID/count/$date";

  static String machines({String key}) => "factories/$key/machines";

  static String machine({String key, String machineID}) => "factories/$key/machines/$machineID";

  static String parts({String key}) => "factories/$key/parts";

  static String reason({String key}) => "factories/$key/reason";

  static String factories({String uid}) => "user/$uid/Factories";

  static String hourlyAnalysis({String key, String machineID, String dateString}) => "factories/$key/machines/$machineID/count/$dateString/hourly_analysis";
}
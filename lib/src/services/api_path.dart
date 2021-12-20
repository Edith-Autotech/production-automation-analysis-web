// import 'dart:core';

// class ApiPath {
//   static String imageAssetPath({required String imageName}) =>
//       'assets/images/$imageName';

//   static String userDoc({required String uid}) => 'user/$uid';

//   static String factoryPath({required String uid, required String key}) =>
//       'user/$uid/Factories/$key';

//   static String count({required String key, required String machineID, required String date}) =>
//       "factories/$key/machines/$machineID/count/$date";

//   static String machines({required String key}) => "factories/$key/machines";

//   static String machine({required String key, required String machineID}) =>
//       "factories/$key/machines/$machineID";

//   static String parts({required String key}) => "factories/$key/parts";

//   static String reason({required String key}) => "factories/$key/reason";

//   static String factories({required String uid}) => "user/$uid/Factories";

//   static String hourlyAnalysis(
//           {String key, String machineID, String dateString}) =>
//       "factories/$key/machines/$machineID/count/$dateString/hourly_analysis";

//   static String stock({String key, String partNumber}) =>
//       'factories/$key/parts/$partNumber/Stock';
// }

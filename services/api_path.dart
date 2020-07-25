import 'dart:core';

class ApiPath {
  static String imageAssetPath({String imageName}) =>
      'assets/images/$imageName';
  static String factoryPath({String uid, String key}) =>
      'user/$uid/Factories/$key';
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/user.dart';
import 'package:production_automation_web/services/api_path.dart';

abstract class FirestoreDatabase {
  Future<void> setFactory();
}

class Database with ChangeNotifier implements FirestoreDatabase {
  Future<void> _setData({String path, Map<String, dynamic> value}) async {
    await Firestore.instance.document(path).setData(value);
  }

  @override
  Future<void> setFactory({User user, String key, String name}) async {
    await _setData(path: ApiPath.factoryPath(key: key, uid: user.uid), value: {
      "name": name,
      "key": key,
    });
  }
}

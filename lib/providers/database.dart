import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/count_model.dart';
import 'package:production_automation_web/models/factory.dart';
import 'package:production_automation_web/models/machine.dart';
import 'package:production_automation_web/models/part.dart';
import 'package:production_automation_web/models/stock.dart';
import 'package:production_automation_web/models/user.dart';
import 'package:production_automation_web/services/api_path.dart';

abstract class FirestoreDatabase {
  Future<void> setFactory({UserModel user, String key, String name});
  Future<void> updateOperationNo(
      {FactoryModel factoryModel, Machine machineModel, int opNumber});
  Future<void> confrmProductionState(
      {FactoryModel factoryModel, Machine machineModel});
  Future<void> updatePartNumber(
      {FactoryModel factoryModel, Machine machineModel, Part selectedPart});
  Future<void> updateReasonCode(
      {FactoryModel factoryModel, Machine machineModel, String reason});
  Future<CountModel> fetchCountModel(
      {FactoryModel factoryModel, Machine machineModel});
  Machine returnMachineFromDocument({DocumentSnapshot snapshot});
  Part returnPartFromDocument({DocumentSnapshot snapshot});
  FactoryModel returnFactoryFromDocument({DocumentSnapshot snapshot});
  Stock returnStockFromDocument({DocumentSnapshot snapshot});
  CountModel returnCountfromDocument(String date, {DocumentSnapshot snapshot});
}

class Database with ChangeNotifier implements FirestoreDatabase {
  final _firebaseDatabase = FirebaseFirestore.instance;

  Future<void> _setData({String path, Map<String, dynamic> value}) async {
    await _firebaseDatabase.doc(path).set(value);
  }

  @override
  Future<void> setFactory({UserModel user, String key, String name}) async {
    await _setData(path: ApiPath.factoryPath(key: key, uid: user.uid), value: {
      "name": name,
      "key": key,
    });
  }

  @override
  Future<void> updateOperationNo(
      {FactoryModel factoryModel, Machine machineModel, int opNumber}) async {
    await _firebaseDatabase
        .doc(ApiPath.machine(
      key: factoryModel.key,
      machineID: machineModel.machineId,
    ))
        .update({"working_operation_number": "Operation $opNumber"});
  }

  @override
  Future<void> confrmProductionState(
      {FactoryModel factoryModel, Machine machineModel}) async {
    await _firebaseDatabase
        .doc(ApiPath.machine(
            key: factoryModel.key, machineID: machineModel.machineId))
        .update({'previous_state': "Production"});
  }

  @override
  Future<void> updatePartNumber(
      {FactoryModel factoryModel,
      Machine machineModel,
      Part selectedPart}) async {
    await _firebaseDatabase
        .doc(ApiPath.machine(
            key: factoryModel.key, machineID: machineModel.machineId))
        .update({"working_part_number": selectedPart.partNumber});
  }

  @override
  Future<void> updateReasonCode(
      {FactoryModel factoryModel, Machine machineModel, String reason}) async {
    await _firebaseDatabase
        .doc(ApiPath.machine(
            key: factoryModel.key, machineID: machineModel.machineId))
        .update({'reason_code': reason});
  }

  @override
  Machine returnMachineFromDocument({DocumentSnapshot snapshot}) {
    return Machine(
      machineId: snapshot.id,
      currentOperation: snapshot.data()["working_operation_number"],
      currentPart: snapshot.data()["working_part_number"],
      previousState: snapshot.data()["previous_state"],
      reasonCode: snapshot.data()["reason_code"],
      previousTimeStroke: snapshot.data()["pts"],
    );
  }

  @override
  CountModel returnCountfromDocument(String date, {DocumentSnapshot snapshot}) {
    return CountModel(
        date: date,
        count: snapshot.data()['count'],
        idleTime: snapshot.data()['idle_time'],
        productionTime: snapshot.data()['production_time'],
        standbyTime: snapshot.data()['standby_time']);
  }

  @override
  Part returnPartFromDocument({DocumentSnapshot snapshot}) {
    return Part(
        companyName: snapshot.data()['company_name'].toString(),
        noOfOperations: snapshot.data()['no_of_operations'].toString(),
        partName: snapshot.data()['part_name'].toString(),
        partNumber: snapshot.data()['part_number'].toString());
  }

  @override
  Stock returnStockFromDocument({DocumentSnapshot snapshot}) {
    print(snapshot.data()['stock']);
    print(snapshot.id);
    return Stock(
      operationNo: snapshot.id,
      stock: snapshot.data()['stock'].toString(),
    );
  }

  @override
  FactoryModel returnFactoryFromDocument({DocumentSnapshot snapshot}) {
    return FactoryModel(
      key: snapshot.data()["key"],
      name: snapshot.data()["name"],
    );
  }

  @override
  Future<CountModel> fetchCountModel(
      {FactoryModel factoryModel, Machine machineModel}) async {
    DateTime today = DateTime.now();
    String dateString = today.toString().split(" ")[0];

    DocumentReference machineDocument = _firebaseDatabase.doc(ApiPath.count(
      key: factoryModel.key,
      machineID: machineModel.machineId,
      date: dateString,
    ));

    return await machineDocument
        .get()
        .then((value) => returnCountfromDocument(dateString, snapshot: value))
        .catchError((error) {
      print(error);
      return CountModel(
        count: 0,
        date: dateString,
        idleTime: "No Data",
        productionTime: "No Data",
        standbyTime: "No Data",
      );
    });
  }
}

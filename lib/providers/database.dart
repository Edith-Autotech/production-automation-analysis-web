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
  Stream<List<Machine>> getMachines({FactoryModel factoryModel});
  Stream<List<FactoryModel>> getFactories({UserModel userModel});
  Stream<List<Part>> getParts({FactoryModel model});
  Future<void> updateOperationNo(
      {FactoryModel factoryModel,
      Machine machineModel,
      int opNumber,
      int index});
  Future<void> confrmProductionState(
      {FactoryModel factoryModel, Machine machineModel});
  Future<void> updatePartNumber(
      {FactoryModel factoryModel,
      Machine machineModel,
      Part selectedPart,
      int index});
  Stock returnStockFromDocument({DocumentSnapshot snapshot});
  Future<void> updateMachineName({FactoryModel factoryModel, Machine machine});
  Future<void> updateReasonCode(
      {FactoryModel factoryModel, Machine machineModel, String reason});
  Future<void> updateParallelDevice();
  Future<CountModel> fetchCountModel(
      {FactoryModel factoryModel, Machine machineModel});
  Machine returnMachineFromDocument({DocumentSnapshot snapshot});
  Part returnPartFromDocument({DocumentSnapshot snapshot});
  CountModel returnCountfromDocument(String date, {DocumentSnapshot snapshot});
}

class Database with ChangeNotifier implements FirestoreDatabase {
  final FirebaseFirestore _firebaseDatabase = FirebaseFirestore.instance;

  Future<void> _setData({String path, Map<String, dynamic> value}) async {
    _firebaseDatabase.doc(path).set(value);
  }

  Future<void> _updateData({String path, Map<String, dynamic> value}) async {
    _firebaseDatabase.doc(path).update(value);
  }

  @override
  Future<void> setFactory({UserModel user, String key, String name}) async {
    _setData(path: ApiPath.factoryPath(key: key, uid: user.uid), value: {
      "name": name,
      "key": key,
    });
  }

  @override
  Stream<List<Machine>> getMachines({FactoryModel factoryModel}) {
    return _firebaseDatabase
        .collection(ApiPath.machines(key: factoryModel.key))
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((document) {
        return returnMachineFromDocument(snapshot: document);
      }).toList();
    });
  }

  @override
  Stream<List<FactoryModel>> getFactories({UserModel userModel}) {
    return _firebaseDatabase
        .collection(ApiPath.factories(uid: userModel.uid))
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((document) => returnFactoryFromDocument(snapshot: document))
          .toList();
    });
  }

  @override
  Stream<List<Part>> getParts({FactoryModel model}) {
    return _firebaseDatabase
        .collection(ApiPath.parts(key: model.key))
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((document) => returnPartFromDocument(snapshot: document))
          .toList();
    });
  }

  @override
  Future<void> updateOperationNo({
    FactoryModel factoryModel,
    Machine machineModel,
    int opNumber,
    int index,
  }) async {
    _updateData(
        path: ApiPath.machine(
          key: factoryModel.key,
          machineID: machineModel.id,
        ),
        value: index == 0
            ? {
                "working_operation_number": {
                  "1-A": "Operation $opNumber",
                  "1-B": machineModel.currentOperation2,
                }
              }
            : {
                "working_operation_number": {
                  "1-A": machineModel.currentOperation1,
                  "1-B": "Operation $opNumber",
                }
              });
  }

  @override
  Future<void> confrmProductionState(
      {FactoryModel factoryModel, Machine machineModel}) async {
    _updateData(
        path:
            ApiPath.machine(key: factoryModel.key, machineID: machineModel.id),
        value: {'previous_state': "Production"});
  }

  @override
  Future<void> updatePartNumber(
      {FactoryModel factoryModel,
      int index,
      Machine machineModel,
      Part selectedPart}) async {
    _updateData(
        path:
            ApiPath.machine(key: factoryModel.key, machineID: machineModel.id),
        value: index == 0
            ? {
                "working_part_number": {
                  "1-A": selectedPart.partNumber,
                  "1-B": machineModel.currentPart2,
                }
              }
            : {
                "working_part_number": {
                  "1-A": machineModel.currentPart1,
                  "1-B": selectedPart.partNumber
                }
              });
  }

  @override
  Future<void> updateReasonCode(
      {FactoryModel factoryModel, Machine machineModel, String reason}) async {
    _firebaseDatabase
        .doc(ApiPath.machine(key: factoryModel.key, machineID: machineModel.id))
        .update({'reason_code': reason});
  }

  @override
  Future<void> updateMachineName(
      {FactoryModel factoryModel, Machine machine, String newName}) async {
    _updateData(
        path: ApiPath.machine(key: factoryModel.key, machineID: machine.id),
        value: {
          "name": newName,
        });
  }

  @override
  Future<void> updateParallelDevice(
      {FactoryModel model, Machine machine, String value}) async {
    _updateData(
        path: ApiPath.machine(key: model.key, machineID: machine.id),
        value: {'parallel_devices': value});
  }

  FactoryModel returnFactoryFromDocument({DocumentSnapshot snapshot}) =>
      FactoryModel(
        key: snapshot.data()["key"],
        name: snapshot.data()["name"],
      );

  @override
  Machine returnMachineFromDocument({DocumentSnapshot snapshot}) => Machine(
        id: snapshot.id,
        name: snapshot.data()['name'],
        parallelState: snapshot.data()['parallel_devices'],
        currentOperation1: snapshot.data()["working_operation_number"]["1-A"],
        currentPart1: snapshot.data()["working_part_number"]["1-A"],
        currentOperation2: snapshot.data()["working_operation_number"]["1-B"],
        currentPart2: snapshot.data()["working_part_number"]["1-B"],
        previousState: snapshot.data()["previous_state"],
        reasonCode: snapshot.data()["reason_code"],
        previousTimeStroke: snapshot.data()["pts"],
      );

  @override
  CountModel returnCountfromDocument(String date,
          {DocumentSnapshot snapshot}) =>
      CountModel(
          date: date,
          count: snapshot.data()['count'],
          idleTime: snapshot.data()['idle_time'],
          productionTime: snapshot.data()['production_time'],
          standbyTime: snapshot.data()['standby_time']);

  @override
  Part returnPartFromDocument({DocumentSnapshot snapshot}) => Part(
      companyName: snapshot.data()['company_name'].toString(),
      noOfOperations: snapshot.data()['no_of_operations'].toString(),
      partName: snapshot.data()['part_name'].toString(),
      partNumber: snapshot.data()['part_number'].toString());

  @override
  Future<CountModel> fetchCountModel(
      {FactoryModel factoryModel, Machine machineModel}) async {
    DateTime today = DateTime.now();
    String dateString = today.toString().split(" ")[0];

    DocumentReference machineDocument = _firebaseDatabase.doc(ApiPath.count(
      key: factoryModel.key,
      machineID: machineModel.id,
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

  @override
  Stock returnStockFromDocument({DocumentSnapshot snapshot}) {
    print(snapshot.data()['stock']);
    print(snapshot.id);
    return Stock(
      operationNo: snapshot.id,
      stock: snapshot.data()['stock'].toString(),
    );
  }
}

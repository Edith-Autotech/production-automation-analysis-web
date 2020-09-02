import 'package:cloud_firestore/cloud_firestore.dart';

class CountModel {
  final String date;
  final int count;
  final String idleTime;
  final String productionTime;
  final String standbyTime;
  CountModel({
    this.date,
    this.count,
    this.idleTime,
    this.productionTime,
    this.standbyTime,
  });
  CountModel fromDocumentSnapshot(String date, {DocumentSnapshot snapshot}) =>
      CountModel(
          date: date,
          count: snapshot.data['count'],
          idleTime: snapshot.data['idle_time'],
          productionTime: snapshot.data['production_time'],
          standbyTime: snapshot.data['standby_time']);
}

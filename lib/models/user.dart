import 'dart:convert';

import 'package:production_automation_web/helper/user_roles_enum.dart';

// ? User Model

// * ---------------------------RESPONSE--------------------------
//   {
//       "_id": "610b8af98cf7af0015b4c124",
//       "email": "omkar0406@gmail.com",
//       "name": "Omk-tester1"
//     }
// * ----------------------------------------------------------------------
class UserModel {
  final String uid;
  // final bool admin; // ? will be implemented in v1.0.5+2
  final String name;
  final String email;
  final String? comapanyName; // ? will be implemented in v1.0.5+2
  final String factoryId;
  final UserRolesEnum role;

  UserModel({
    // this.admin = true,
    this.uid = "",
    this.name = "",
    this.email = "",
    this.comapanyName,
    this.factoryId = '',
    this.role = UserRolesEnum.siteWorker,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? comapanyName,
    String? factoryId,
    UserRolesEnum? role,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      comapanyName: comapanyName ?? this.comapanyName,
      factoryId: factoryId ?? this.factoryId,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'comapanyName': comapanyName,
      'factoryId': factoryId,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      comapanyName: map['comapanyName'],
      factoryId: map['factoryId'] ?? '',
      role: returnEnumFromString(map['role']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, comapanyName: $comapanyName, factoryId: $factoryId, role: $role)';
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.comapanyName == comapanyName &&
        other.factoryId == factoryId &&
        other.role == role;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ email.hashCode ^ comapanyName.hashCode ^ factoryId.hashCode ^ role.hashCode;
  }
}

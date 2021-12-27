import 'dart:convert';

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
  final bool admin; // ? will be implemented in v1.0.5+2
  final String name;
  final String email;
  final String? comapanyName; // ? will be implemented in v1.0.5+2

  UserModel({
    this.uid = "",
    this.admin = true,
    this.name = "",
    this.email = "",
    this.comapanyName,
  });

  UserModel copyWith({
    String? uid,
    bool? admin,
    String? name,
    String? imageUrl,
    String? email,
    String? comapanyName,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      admin: admin ?? this.admin,
      name: name ?? this.name,
      email: email ?? this.email,
      comapanyName: comapanyName ?? this.comapanyName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'admin': admin,
      'name': name,
      'email': email,
      'comapanyName': comapanyName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
// {
//   "_id": "610b93515f0635ab09ceb742",
//   "email": "omkar.tralsawala@gmail.com",
//   "name": "OMKAR TRALSAWALA"
// }
    Map<String, String?> userData = map['data']['user'];
    return UserModel(
      uid: userData['_id']!,
      admin: true,
      name: userData['name']!,
      email: userData['email']!,
      comapanyName: "undefined",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, admin: $admin, name: $name, email: $email, comapanyName: $comapanyName)';
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.uid == uid &&
        o.admin == admin &&
        o.name == name &&
        o.email == email &&
        o.comapanyName == comapanyName;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ admin.hashCode ^ name.hashCode ^ email.hashCode ^ comapanyName.hashCode;
  }
}

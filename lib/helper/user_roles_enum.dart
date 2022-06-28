import 'package:flutter/material.dart';
import 'package:production_automation_web/constants/style.dart';

enum UserRolesEnum {
  superUser,
  admin,
  siteWorker,
  client,
}

UserRolesEnum returnEnumFromString(String userRoleString) {
  // print(userRoleString);
  // print(userRoleString.compareTo('super-user'));
  switch (userRoleString) {
    case 'super-user':
      return UserRolesEnum.superUser;
    case 'admin':
      return UserRolesEnum.admin;
    case 'site-worker':
      return UserRolesEnum.siteWorker;
    case 'client':
      return UserRolesEnum.client;
    default:
      return UserRolesEnum.siteWorker;
  }
}

String returnStringFromEnum(UserRolesEnum roles) {
  switch (roles) {
    case UserRolesEnum.superUser:
      return 'super-user';
    case UserRolesEnum.admin:
      return 'admin';
    case UserRolesEnum.siteWorker:
      return 'site-worker';
    case UserRolesEnum.client:
      return 'client';
  }
}

Color returnColorFromEnum(UserRolesEnum roles) {
  switch (roles) {
    case UserRolesEnum.superUser:
      return superUserColor;
    case UserRolesEnum.admin:
      return adminColor;
    case UserRolesEnum.siteWorker:
      return siteWorkerColor;
    case UserRolesEnum.client:
      return clientColor;
  }
}

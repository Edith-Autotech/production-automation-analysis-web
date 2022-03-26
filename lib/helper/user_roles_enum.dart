import 'package:flutter/material.dart';
import 'package:production_automation_web/constants/style.dart';

enum userRolesEnum {
  superUser,
  admin,
  siteWorker,
  client,
}

userRolesEnum returnEnumFromString(String userRoleString) {
  // print(userRoleString);
  // print(userRoleString.compareTo('super-user'));
  switch (userRoleString) {
    case 'super-user':
      return userRolesEnum.superUser;
    case 'admin':
      return userRolesEnum.admin;
    case 'site-worker':
      return userRolesEnum.siteWorker;
    case 'client':
      return userRolesEnum.client;
    default:
      return userRolesEnum.siteWorker;
  }
}

String returnStringFromEnum(userRolesEnum roles) {
  switch (roles) {
    case userRolesEnum.superUser:
      return 'super-user';
    case userRolesEnum.admin:
      return 'admin';
    case userRolesEnum.siteWorker:
      return 'site-worker';
    case userRolesEnum.client:
      return 'client';
  }
}

Color returnColorFromEnum(userRolesEnum roles) {
  switch (roles) {
    case userRolesEnum.superUser:
      return superUserColor;
    case userRolesEnum.admin:
      return adminColor;
    case userRolesEnum.siteWorker:
      return siteWorkerColor;
    case userRolesEnum.client:
      return clientColor;
  }
}

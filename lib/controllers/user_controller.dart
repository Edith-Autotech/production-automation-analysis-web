import 'package:get/get.dart';

import '/helper/user_roles_enum.dart';
import '/models/user.dart';
import '/services/user_service.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  var activeUser = UserModel().obs;
  var activeUserRole = UserRolesEnum.superUser.obs;
  var allFactoryUsers = <UserModel>[].obs;
  var isLoading = false.obs;
  var authToken = "".obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   login("superuser@paa.com", "admin-01");
  // }

  _updateLoading(bool loading) {
    isLoading.value = loading;
  }

  _updateToken(String? token) {
    if (token != null) {
      authToken.value = token;
    }
  }

  _updateActiveUser(UserModel? user) {
    if (user != null) {
      activeUser.value = user;
    }
  }

  _updateAllFactoryUser(List<UserModel>? users) {
    if (users != null) {
      allFactoryUsers.value = users;
    }
  }

  login(String email, String password) async {
    _updateLoading(true);
    var token = await UserService.login(email, password);
    _updateToken(token);
    await getCurrentUser();
    _updateLoading(false);
  }

  getCurrentUser() async {
    var user = await UserService.currentUser(authToken.value);
    // print(user);
    _updateActiveUser(user);
  }

  getAllFactoryUsers() async {
    // _updateLoading(true);
    await UserService.allFactoryUsers(
      authToken.value,
      activeUser.value.factoryId,
    ).then((allUsers) => _updateAllFactoryUser(allUsers));
    // _updateLoading(false);
  }

  void Function(UserRolesEnum?)? onDropDownChange(UserModel user) {
    // print(user.uid);
    switch (activeUser.value.role) {
      case UserRolesEnum.superUser:
        return (value) {
          // print(value);
          // updateUser(user.copyWith(role: value));
        };
      case UserRolesEnum.admin:
        return (value) {
          // print(value);
          // updateUser(user.copyWith(role: value));
        };
      case UserRolesEnum.siteWorker:
        return null;
      case UserRolesEnum.client:
        return null;
    }
  }

  updateUser(UserModel user) async {
    _updateLoading(true);
    // await UserService.updateUser(
    //   authToken.value,
    //   user.name,
    //   returnStringFromEnum(user.role),
    // );
    _updateLoading(false);
  }

  logout() {
    _updateToken("");
  }
}

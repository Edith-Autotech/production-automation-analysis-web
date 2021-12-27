import 'package:get/get.dart';

import '/services/user_service.dart';

import '/models/user.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  var activeUser = UserModel().obs;
  var isLoading = false.obs;
  var authToken = "".obs;

  @override
  void onInit() {
    super.onInit();
    login("admin@paa.com", "admin-01");
  }

  updateLoading(bool loading) {
    isLoading.value = loading;
  }

  login(String email, String password) async {
    updateLoading(true);
    var token = await UserService.login(email, password);
    // print(token);
    if (token != null) {
      authToken.value = token;
    }
    // print(authToken.value);
    updateLoading(false);
  }

  getCurrentUser() async {
    updateLoading(true);
    var user = await UserService.currentUser(authToken.value);
    if (user != null) {
      activeUser.value = user;
    }
    updateLoading(false);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/layout.dart';
import '/pages/authentication/login.dart';
import '/widgets/loading_spinner.dart';

class AuthLanding extends StatelessWidget {
  const AuthLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userController.authToken.value == "") {
        return const LoginScreen();
      } else if (userController.isLoading.value) {
        return loadingSpinner();
      } else {
        return SiteLayout();
      }
    });
  }
}

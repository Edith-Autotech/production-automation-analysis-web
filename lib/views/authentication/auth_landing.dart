import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/layout.dart';
import '/widgets/loading_spinner.dart';
import 'login.dart';

class AuthLanding extends StatelessWidget {
  const AuthLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userController.authToken.value.isEmpty) {
        return const LoginScreen();
      } else if (userController.isLoading.value) {
        return const LoadingSpinner();
      } else {
        return SiteLayout();
      }
    });
  }
}

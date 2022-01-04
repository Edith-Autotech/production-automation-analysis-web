import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/models/factory.dart';
import '/services/factory_service.dart';

class FactoryController extends GetxController {
  static FactoryController instance = Get.find();

  var isLoading = false.obs;
  var activeFactory = Factory().obs;

  updateLoading(bool loading) {
    isLoading.value = loading;
  }

  Future getFactory() async {
    updateLoading(true);
    try {
      if (userController.authToken.value.isNotEmpty) {
        var _factory = await FactoryService.factory(userController.authToken.value);
        // print(userController.authToken.value);
        if (_factory != null) {
          activeFactory.value = _factory;
        }
      }
    } catch (error) {
      // print(error);
      // Fluttertoast.showToast(msg: error.toString());
    } finally {
      updateLoading(false);
    }
  }

  updateFactory(Factory factory) async {
    updateLoading(true);
    await FactoryService.updateFactory(userController.authToken.value, factory);
    updateLoading(false);
  }
}

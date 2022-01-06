import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/models/factory.dart';
import '/services/factory_service.dart';

class FactoryController extends GetxController {
  static FactoryController instance = Get.find();

  var isLoading = false.obs;
  var activeFactory = Factory().obs;

  _updateLoading(bool loading) {
    isLoading.value = loading;
  }

  _updateActiveFactory(Factory? _factory) {
    if (_factory != null) {
      activeFactory.value = _factory;
    }
  }

  Future getFactory() async {
    _updateLoading(true);
    try {
      if (userController.authToken.value.isNotEmpty) {
        var _factory = await FactoryService.factory(
          userController.authToken.value,
          userController.activeUser.value.factoryId,
        );
        // print(userController.authToken.value);
        _updateActiveFactory(_factory);
      }
    } catch (error) {
      // print(error);
      // Fluttertoast.showToast(msg: error.toString());
    } finally {
      _updateLoading(false);
    }
  }

  updateFactory(Factory factory) async {
    _updateLoading(true);
    await FactoryService.updateFactory(userController.authToken.value, factory);
    _updateLoading(false);
  }
}

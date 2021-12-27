import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/services/count_service.dart';

import '/models/count.dart';

class CountController extends GetxController {
  static CountController instance = Get.find();

  var isLoading = false.obs;
  var todaysCount = Count().obs;
  var todaysDate = "2021-07-23".obs;

  updateLoading(bool _loading) {
    isLoading.value = _loading;
  }

  updateTodaysCount(Count _count) {
    todaysCount.value = _count;
  }

  fetchCount() async {
    updateLoading(true);
    try {
      var count = await CountService.dailyCount(
        userController.authToken.value,
        todaysDate.value,
        machineController.selectedMachine.value.id,
      );
      // print(count);
      if (count != null) {
        updateTodaysCount(count);
      }
    } catch (error) {
      // print(error);
      rethrow;
    } finally {
      updateLoading(false);
    }
    // print(isLoading.value);
  }
}

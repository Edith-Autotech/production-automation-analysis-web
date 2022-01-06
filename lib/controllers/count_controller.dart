import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/services/count_service.dart';

import '/models/count.dart';

class CountController extends GetxController {
  static CountController instance = Get.find();

  var isLoading = false.obs;
  var todaysCount = Count().obs;
  var activeDate = "2022-01-04".obs;

  updateLoading(bool _loading) {
    isLoading.value = _loading;
  }

  updateActiveDate(String newDateString) {
    activeDate.value = newDateString.split(" ")[0];
  }

  updateTodaysCount(Count _count) {
    todaysCount.value = _count;
  }

  fetchCount() async {
    updateLoading(true);
    try {
      var count = await CountService.dailyCount(
        userController.authToken.value,
        activeDate.value,
        machineController.selectedMachine.value.id,
      );
      // print(count);
      if (count != null) {
        updateTodaysCount(count);
        updateLoading(false);
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

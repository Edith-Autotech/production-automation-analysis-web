import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/services/count_service.dart';

import '/models/count.dart';

class CountController extends GetxController {
  static CountController instance = Get.find();

  var isLoading = false.obs;
  var todaysCount = Count().obs;
  var activeDate = "2022-01-04".obs;

  toogleLoading() {
    isLoading.value = !isLoading.value;
  }

  updateActiveDate(String newDateString) {
    activeDate.value = newDateString.split(" ")[0];
    fetchCount();
  }

  updateTodaysCount(Count? _count) {
    if (_count != null) {
      todaysCount.value = _count;
    }
  }

  fetchCount() async {
    toogleLoading();
    try {
      var count = await CountService.dailyCount(
        userController.authToken.value,
        activeDate.value,
        machineController.selectedMachine.value.id,
      );
      // print(count);
      updateTodaysCount(count);
    } catch (error) {
      rethrow;
    } finally {
      toogleLoading();
    }
  }
}

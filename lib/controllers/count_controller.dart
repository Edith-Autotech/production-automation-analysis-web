import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:production_automation_web/helper/logger.dart';

import '/constants/controllers.dart';
import '/models/count.dart';
import '/services/count_service.dart';

class CountController extends GetxController {
  static CountController instance = Get.find();

  var isLoading = false.obs;
  var todaysCount = Rxn<Count>();
  var activeDate = "2022-01-04".obs;

  @override
  void onInit() {
    super.onInit();
    updateActiveDate(DateTime.now().toString());
  }

  toogleLoading() {
    isLoading.value = !isLoading.value;
  }

  updateActiveDate(String newDateString) {
    activeDate.value = newDateString.split(" ")[0];
    fetchCount();
  }

  updateTodaysCount(Count? _count) {
    logger.log(Level.verbose, _count.toString());
    todaysCount.value = _count;
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

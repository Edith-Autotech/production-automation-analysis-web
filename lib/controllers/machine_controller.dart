import 'package:get/get.dart';

import '/constants/controllers.dart';

import '/models/machine.dart';
import '/services/machine_service.dart';

class MachineController extends GetxController {
  static MachineController instance = Get.find();

  var isLoading = false.obs;
  var machineList = <Machine>[].obs;
  var selectedMachine = Machine().obs;

  updateLoading(bool loading) {
    isLoading.value = loading;
  }

  changeSelectedMachine(Machine machine) {
    selectedMachine.value = machine;
  }

  fetchMachines() async {
    updateLoading(true);
    try {
      var machines = await MachineService.machines(
        userController.authToken.value,
        userController.activeUser.value.factoryId,
      );
      if (machines != null) {
        machineList.value = machines;
      }
    } catch (error) {
      // print(error);
      rethrow;
    } finally {
      updateLoading(false);
    }
  }

  fetchMachine(String machineId) async {
    updateLoading(true);
    var machine = await MachineService.machine(
      userController.authToken.value,
      machineId,
    );
    if (machine != null) {
      selectedMachine.value = machine;
    }
    updateLoading(false);
  }

  updateMachine(Machine machine) async {
    updateLoading(true);
    await MachineService.updateMachine(
      userController.authToken.value,
      machine,
    );
    updateLoading(false);
  }
}

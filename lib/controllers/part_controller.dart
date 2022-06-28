import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/models/part.dart';
import '/services/part_service.dart';

class PartController extends GetxController {
  static PartController instance = Get.find();

  RxBool isLoading = false.obs;
  Rxn<Part> selectedPart = Rxn<Part>();
  RxList<Part> partsList = RxList<Part>();
  RxString searchPartNumberString = "".obs;

  updateLoading(bool _isLoading) {
    isLoading.value = _isLoading;
  }

  changeSelectedPart(Part _part) {
    selectedPart.value = _part;
  }

  updatePartsList(List<Part> _parts) {
    partsList.value = _parts;
    // print(partsList);
  }

  updateSearchString(String partNumberString) {
    searchPartNumberString.value = partNumberString.toLowerCase();
  }

  fetchParts() async {
    // print("Fetch parts called");
    updateLoading(true);
    var _parts = await PartService.parts(
      userController.authToken.value,
      userController.activeUser.value.factoryId,
    );
    // print(_parts);
    if (_parts != null) {
      updatePartsList(_parts);
    }
    updateLoading(false);
  }

  // fetchPart() async {
  //   updateLoading(true);
  //   try {
  //     var _part = await PartService.part(
  //       userController.authToken.value,
  //       selectedPart.value.partId,
  //     );
  //   } catch (error) {
  //     print(error);
  //   } finally {
  //     updateLoading(false);
  //   }
  // }
}

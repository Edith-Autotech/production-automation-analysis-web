import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/models/reason.dart';
import '/services/reason_service.dart';

class ReasonController extends GetxController {
  static ReasonController instance = Get.find();

  var reasonList = <Reason>[].obs;
  var isLoading = false.obs;

  _updateLoading(bool loading) {
    isLoading.value = loading;
  }

  _updateReasonList(List<Reason>? reasons) {
    if (reasons != null) {
      reasons.sort((a, b) => a.reasonCode.compareTo(b.reasonCode));
      reasonList.value = reasons;
    }
  }

  getReasons() async {
    _updateLoading(true);
    var reasons = await ReasonService.reasons(
      userController.authToken.value,
    );

    _updateReasonList(reasons);
    _updateLoading(false);
  }
}

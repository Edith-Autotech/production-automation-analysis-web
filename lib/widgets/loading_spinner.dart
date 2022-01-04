import 'package:flutter/material.dart';

import '/constants/style.dart';

Widget loadingSpinner() {
  return Center(
    child: CircularProgressIndicator(color: active),
  );
}

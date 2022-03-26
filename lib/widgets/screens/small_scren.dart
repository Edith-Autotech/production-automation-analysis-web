import 'package:flutter/material.dart';

import '/helper/local_navigation.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: localNavigator(),
    );
  }
}

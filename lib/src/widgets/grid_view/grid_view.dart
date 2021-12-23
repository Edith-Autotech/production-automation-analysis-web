import 'package:flutter/material.dart';

import '../../../../constants.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    required this.data,
    required this.token,
    required this.childItem,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List data;
  final String token;
  final Widget Function(dynamic, String) childItem;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(Constants.defaultPadding),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: Constants.defaultPadding,
        mainAxisSpacing: Constants.defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => childItem(data[index], token),
    );
  }
}

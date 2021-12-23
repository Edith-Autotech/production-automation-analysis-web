import 'package:flutter/material.dart';
import 'package:production_automation_web/responsive.dart';
import 'package:production_automation_web/src/screens/dashboard/components/state_card.dart';
import 'package:production_automation_web/src/widgets/grid_view/grid_view.dart';

class StateCardGridView extends StatelessWidget {
  const StateCardGridView({
    Key? key,
    required this.data,
    required this.token,
  }) : super(key: key);

  final List data;
  final String token;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Responsive(
      mobile: CustomGridView(
        data: data,
        token: token,
        crossAxisCount: _size.width < 650 ? 2 : 3,
        childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
        childItem: (p0, p1) => StateCard(token: p1),
      ),
      tablet: CustomGridView(
        data: data,
        token: token,
        childItem: (p0, p1) => StateCard(token: p1),
      ),
      desktop: CustomGridView(
        data: data,
        token: token,
        crossAxisCount: _size.width < 650 ? 2 : 3,
        childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        childItem: (p0, p1) => StateCard(token: p1),
      ),
    );
  }
}

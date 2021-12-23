import 'package:flutter/material.dart';

import '/responsive.dart';
import '/src/models/machine.dart';
import '/src/screens/machines/components/machine_card.dart';
import '/src/widgets/grid_view/grid_view.dart';

class MachineCardGridView extends StatelessWidget {
  const MachineCardGridView({
    Key? key,
    required this.data,
    required this.token,
  }) : super(key: key);

  final List<Machine> data;
  final String token;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Responsive(
      mobile: CustomGridView(
        data: data,
        token: token,
        crossAxisCount: _size.width < 650 ? 2 : 4,
        childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
        childItem: (p0, p1) => MachineCard(
          machine: p0,
          token: p1,
        ),
      ),
      tablet: CustomGridView(
        data: data,
        token: token,
        childItem: (p0, p1) => MachineCard(
          machine: p0,
          token: p1,
        ),
      ),
      desktop: CustomGridView(
        data: data,
        token: token,
        crossAxisCount: _size.width < 650 ? 2 : 4,
        childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        childItem: (p0, p1) => MachineCard(
          machine: p0,
          token: p1,
        ),
      ),
    );
  }
}

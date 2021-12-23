import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/routes/routes.dart';
import '/src/screens/machines/machines_screen.dart';
import 'components/side_menu.dart';
import '/responsive.dart';
import '/config/controllers/menu_controller.dart';

class MainScreen extends StatefulWidget {
  final Widget? child;
  final String token;
  const MainScreen({
    Key? key,
    required this.child,
    required this.token,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (widget.child == null) {
        // print(widget.token);
        Navigator.pushReplacementNamed(
          context,
          routeMachines,
          arguments: MachinesScreenArguments(widget.token),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(token: widget.token),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(token: widget.token),
              ),
            Expanded(
              child: widget.child!,
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}

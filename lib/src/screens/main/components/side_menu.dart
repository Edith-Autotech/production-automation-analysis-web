import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:production_automation_web/src/routes/routes.dart';
import 'package:production_automation_web/src/screens/machines/machines_screen.dart';

class SideMenu extends StatefulWidget {
  final String token;
  const SideMenu({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  int index = 0;

  void logout() async {
    await _storage.delete(key: 'jwt');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          _listTile(
            title: "Machines",
            svgSrc: "assets/icons/menu_tran.svg",
            onTap: () {
              navKey.currentState!.pushNamed(routeMachines, arguments: MachinesScreenArguments(widget.token));
              onHighlight(routeMachines);
            },
            selected: index == 0,
          ),
          _listTile(
            title: "Parts",
            svgSrc: "assets/icons/menu_task.svg",
            onTap: () {
              navKey.currentState!.pushNamed(routeParts);
              onHighlight(routeParts);
            },
            selected: index == 1,
          ),
          _listTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            onTap: () {
              navKey.currentState!.pushNamed(routeProfile);
              onHighlight(routeProfile);
            },
            selected: index == 2,
          ),
          _listTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            onTap: () {
              navKey.currentState!.pushNamed(routeSettings);
              onHighlight(routeSettings);
            },
            selected: index == 3,
          ),
          _listTile(
            title: "logout",
            svgSrc: "assets/icons/menu_setting.svg",
            onTap: logout,
          ),
        ],
      ),
    );
  }

  void onHighlight(String route) {
    switch (route) {
      case routeMachines:
        changeHighlight(0);
        break;
      case routeParts:
        changeHighlight(1);
        break;
      case routeProfile:
        changeHighlight(2);
        break;
      case routeSettings:
        changeHighlight(3);
        break;
    }
  }

  void changeHighlight(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  ListTile _listTile({
    required String title,
    required String svgSrc,
    bool selected = false,
    required void Function() onTap,
  }) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(title),
      selected: selected,
    );
  }
}

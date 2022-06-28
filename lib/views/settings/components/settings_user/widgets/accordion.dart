import 'package:flutter/material.dart';

import '/helper/user_roles_enum.dart';
import '../../../widgets/drop_down_button.dart';

import '/constants/style.dart';
import '/widgets/custom_text.dart';

import '/models/user.dart';

class Accordion extends StatefulWidget {
  final UserModel user;
  const Accordion({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 2,
                  width: double.infinity,
                  color: returnColorFromEnum(widget.user.role),
                ),
                CustomText(widget.user.name),
              ],
            ),
            trailing: IconButton(
              onPressed: () => setState(
                () => _showContent = !_showContent,
              ),
              icon: Icon(
                !_showContent ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              ),
            ),
          ),
          if (_showContent)
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  width: 1,
                  color: lightGrey.withOpacity(.4),
                ),
              )),
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding,
                horizontal: defaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomText("User Id"),
                      CustomText("Email"),
                      CustomText("Role"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(widget.user.uid),
                      CustomText(widget.user.email),
                      showUserRolesDropdown(widget.user),
                    ],
                  ),
                ],
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }
}

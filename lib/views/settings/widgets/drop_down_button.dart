import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/user_roles_enum.dart';
import '/models/user.dart';

import '../../../widgets/custom_text.dart';

showUserRolesDropdown(UserModel user) => DropdownButton<userRolesEnum>(
      value: user.role,
      dropdownColor: light,
      items: userRolesEnum.values
          .map(
            (userRole) => DropdownMenuItem<userRolesEnum>(
              value: userRole,
              child: CustomText(
                text: returnStringFromEnum(userRole),
              ),
            ),
          )
          .toList(),
      onChanged: userController.onDropDownChange(user),
    );

import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/user_roles_enum.dart';
import '/models/user.dart';

import '../../../widgets/custom_text.dart';

showUserRolesDropdown(UserModel user) => DropdownButton<UserRolesEnum>(
      value: user.role,
      dropdownColor: light,
      items: UserRolesEnum.values
          .map(
            (userRole) => DropdownMenuItem<UserRolesEnum>(
              value: userRole,
              child: CustomText(
                returnStringFromEnum(userRole),
              ),
            ),
          )
          .toList(),
      onChanged: userController.onDropDownChange(user),
    );

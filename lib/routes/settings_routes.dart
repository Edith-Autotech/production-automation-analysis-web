const settingsUsersDisplayName = "Users";
const settingsUsersRouteName = "/settings-users";

const settingsAddNewUserDisplayName = "Add new user";
const settingsAddNewUserRouteName = "/settings-add-user";

const settingsFactoryDetailsDisplayName = "Factory Details";
const settingsFactoryDetailsRouteName = "/settings-factory-details";

const settingsReasonsListDisplayName = "Reasons";
const settingsReasonsListRouteName = "/settings-reasons";

class SettingsMenuItem {
  final String name;
  final String route;
  SettingsMenuItem(this.name, this.route);
}

List<SettingsMenuItem> settingsMenuItems = [
  SettingsMenuItem(settingsUsersDisplayName, settingsUsersRouteName),
  SettingsMenuItem(settingsFactoryDetailsDisplayName, settingsFactoryDetailsRouteName),
  SettingsMenuItem(settingsReasonsListDisplayName, settingsReasonsListRouteName),
  SettingsMenuItem(settingsAddNewUserDisplayName, settingsAddNewUserRouteName),
];

const rootRoute = "/";

const overViewPageDisplayName = "Overview";
const overViewPageRouteName = "/overview";

const machinesPageDisplayName = "Machines";
const machinesPageRouteName = "/machines";

const dashboardPageDisplayName = "Dashboard";
const dashboardPageRouteName = "/dashboard";

const partsPageDisplayName = "Parts";
const partsPageRouteName = "/parts";

const partDetailsDisplayName = "Part Details";
const partDetailsRouteName = "/parts-details";

const profilePageDisplayName = "Profile";
const profilePageRouteName = "/profile";

const settingsPageDisplayName = "Settings";
const settingsPageRouteName = "/settings";

const authenticationPageDisplayName = "Log out";
const authenticationPageRouteName = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> menuItems = [
  MenuItem(overViewPageDisplayName, overViewPageRouteName),
  MenuItem(machinesPageDisplayName, machinesPageRouteName),
  MenuItem(partsPageDisplayName, partsPageRouteName),
  MenuItem(profilePageDisplayName, profilePageRouteName),
  MenuItem(settingsPageDisplayName, settingsPageRouteName),
  MenuItem(authenticationPageDisplayName, authenticationPageRouteName),
];

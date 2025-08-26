import '../../../Constants/constant_asset.dart';

class SidebarMenuItem {
  final String iconPath;
  final String label;
  final List<String>? subItems;

  const SidebarMenuItem({
    required this.iconPath,
    required this.label,
    this.subItems,
  });
}

List<SidebarMenuItem> sidebarItems = [
  SidebarMenuItem(iconPath: kaHomeSvg, label: 'Home'),
  SidebarMenuItem(iconPath: kaDealsSvg, label: 'Deals'),
  SidebarMenuItem(iconPath: kaAnalyticsSvg, label: 'Analytics'),
  SidebarMenuItem(iconPath: kaSettingsSvg, label: 'Settings'),
  SidebarMenuItem(iconPath: kaNotificationSvg, label: 'Notifications'),
  // SidebarMenuItem(
  //   iconPath: kaOtherSvg,
  //   label: 'Other',
  //   subItems: const [
  //     'About',
  //     'Services',
  //     'Contact',
  //     'Privacy Policy',
  //     'Terms & Condition',
  //   ],
  // ),
];

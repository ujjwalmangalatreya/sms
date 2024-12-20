// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/navigation_controller.dart';
//
// class SharedDrawer extends StatelessWidget {
//   const SharedDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       elevation: 0, // Remove shadow for web-style sidebar
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerItem(
//             title: 'Dashboard',
//             route: '/dashboard',
//             changePageIndex: 0,
//           ),
//           DrawerItem(
//             title: 'Profile',
//             route: '/profile',
//             changePageIndex: 1,
//           ),
//           DrawerItem(
//             title: 'Students',
//             route: '/students',
//             changePageIndex: 2,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DrawerItem extends StatelessWidget {
//   final NavigationController controller = Get.find<NavigationController>();
//   final String title;
//   final String route;
//   final int changePageIndex;
//   final bool selectedIndex;
//
//   DrawerItem({
//     super.key,
//     required this.title,
//     required this.route,
//     required this.changePageIndex,
//     required this.selectedIndex,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         title,
//         style: TextStyle(
//           color: selectedIndex ? Colors.blue : Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       onTap: () {
//         controller.changePage(changePageIndex); // Get.offNamed(route);
//         // Navigator.pop(context);
//         // controller.currentIndex(changePageIndex);
//       },
//     );
//   }
// }
